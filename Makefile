SOURCES :=			\
	src/gen/ast.cc		\
	src/gen/members.cc	\
	src/gen/node_kind.cc	\
	src/gen/token_kind.cc	\
	src/gen/traverser.cc	\
	src/gen/sxlex.cc	\
	src/gen/yylex.cc	\
	src/gen/yyparse.cc	\
	src/struct/shstr.cc	\
	src/struct/symtab.cc	\
	src/clexer.cc		\
	src/sxlexer.cc		\
	src/lexer.cc		\
	src/main.cc		\
	src/node.cc		\
	src/parser.cc		\
	src/phase.cc		\
	src/shstrs.cc		\
	src/traverser.cc	\
	src/visitor.cc
OBJECTS := $(patsubst src/%,obj/%.o,$(basename $(SOURCES)))

CPPFLAGS := -MD -Isrc -Isrc/gen
CXXFLAGS := -O0 -ggdb3 #-fopenmp

all: cimple xform

.PHONY: xform
xform:
	@$(MAKE) -C transform

cimple: $(OBJECTS)
	@$(LINK.cc) -o $@ $^

obj/%.o: src/%.c
	@echo "  CC   " $<
	@$(COMPILE.c) -o $@ $<

obj/%.o: src/%.cc
	@echo "  CXX  " $<
	@$(COMPILE.cc) -o $@ $<

src/gen/%.hh: src/gen/%.cc ;

src/gen/%.cc: src/%.yy
	@echo "  YACC " $<
	@bison -d -o $@ $<

src/gen/%.cc: src/%.ll
	@echo "  LEX  " $<
	@flex --header-file=$(@:.cc=.h.tmp) -o$@ $<
	@grep -v '^#line' $(@:.cc=.h.tmp) > $(@:.cc=.h.new)
	@(diff $(@:.cc=.h) $(@:.cc=.h.new) || mv $(@:.cc=.h.new) $(@:.cc=.h)) > /dev/null 2>&1
	@rm -f $(@:.cc=.h).*

src/gen/%.y: src/grammar/%.h $(shell find src/grammar -name "*.y")
	mkdir -p $(@D)
	$(CPP) $(YCPPFLAGS) -P -xc $< -o $@
	sed -i -e 's/^%[%{}]//' $@

src/gen/c.ast: src/gen/rules.y $(wildcard tools/grammar/*)
	tools/grammar/gpp -a $< $@

src/gen/token_kind.cc: src/gen/yyparse.hh
	@echo '#include "yyparse.hh"' > $@
	@echo 'char const *token_kind_name (yytokentype kind) {' >> $@
	@echo '  switch (kind) {' >> $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "  case $$i: return \"$$i\";" >> $@;	\
	done
	@echo '  default: return "<invalid>";' >> $@
	@echo '  }' >> $@
	@echo '}' >> $@

src/gen/rules-tok.y: src/gen/yyparse.hh
	@rm -f $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "sx_expression: \"(\" \"sx-token\" sx_location \"$$i\" sx_token \")\"" >> $@;	\
		echo "  { if (\$$5) { \$$\$$ = new token (@3, yytokentype ($$i), get_shstr (\$$5)); }" >> $@;	\
		echo "    else { \$$\$$ = NULL; delete \$$4; } } ;" >> $@;	\
	done
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "sx_token: \"$$i\"" >> $@;	\
		echo "  { \$$\$$ = new token (@\$$, yytokentype (KW_SX_$$i), \"$$i\", sizeof \"$$i\" - 1); } ;" >> $@;	\
	done
	@touch src/yyparse.yy.in

src/gen/tokens-tok.y: src/gen/yyparse.hh
	@rm -f $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "%token KW_SX_$$i \"$$i\"" >> $@;	\
	done
	@touch src/yyparse.yy.in

src/gen/node_kind.h: src/gen/c.ast tools/astgen
	@tools/astgen $< -kh $@

src/gen/node_kind.cc: src/gen/c.ast tools/astgen
	@tools/astgen $< -kc $@

src/gen/forward.h: src/gen/c.ast tools/astgen
	@tools/astgen $< -fwd $@

src/gen/visitor_methods.h: src/gen/c.ast tools/astgen
	@tools/astgen $< -vh $@

src/gen/traverser.cc: src/gen/c.ast tools/astgen
	@tools/astgen $< -vc $@

src/gen/members.cc: src/gen/c.ast tools/astgen
	@tools/astgen $< -r $@

src/gen/ast.h: src/gen/c.ast tools/astgen
	@tools/astgen $< -h $@

src/gen/ast.cc: src/gen/c.ast tools/astgen
	@tools/astgen $< -c $@

src/gen/rules-sx.y: src/gen/c.ast tools/astgen
	@tools/astgen $< -yacc $@

src/gen/tokens-sx.y: src/gen/c.ast tools/astgen
	@tools/astgen $< -tok $@

src/gen/shstrs.h: src/gen/c.ast tools/astgen
	@tools/astgen $< -shstr $@

src/sxlex.ll: src/gen/c.ast src/gen/yyparse.hh tools/astgen
	@tools/astgen $< -lex $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' src/gen/yyparse.hh | grep -v 'KW_SX_' | sort -u); do	\
		echo "\"$$i\"		{ Keyword (SX_$$i); }" >> $@;	\
	done
	@echo '\\"(\\\\.|[^\\\\"])*\\"	{ Token (STRING_LITERAL); }' >> $@
	@echo '[^() \\n;]+		{ Token (STRING_LITERAL); }' >> $@
	@echo '[ \\n]			{ }' >> $@
	@echo '.				{ Token (ERROR); }' >> $@

transform/ast.mli: src/gen/c.ast tools/astgen
	@tools/astgen $< -mli $@

transform/token.ml: src/gen/yyparse.hh
	@echo 'type token_kind =' > $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "  | $$i" >> $@;	\
	done
	@echo ';;' >> $@
	@echo >> $@
	@echo 'let token_kind_of_string s =' >> $@
	@echo '  match s with' >> $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "  | \"$$i\" -> $$i" >> $@;	\
	done
	@echo ';;' >> $@
	@echo >> $@
	@echo 'let string_of_token_kind s =' >> $@
	@echo '  match s with' >> $@
	@for i in $(shell egrep -o '\b(TK_|KW_)\w+' $< | grep -v 'KW_SX_' | sort -u); do	\
		echo "  | $$i -> \"$$i\"" >> $@;	\
	done
	@echo ';;' >> $@

transform/visit.ml: src/gen/c.ast tools/astgen
	@tools/astgen $< -ml $@

src/gen/%-pp.y: src/gen/%.y $(wildcard tools/grammar/*)
	@tools/grammar/gpp -y $< $@

YFILES =			\
	src/gen/rules-pp.y	\
	src/gen/rules-sx.y	\
	src/gen/tokens.y	\
	src/gen/tokens-sx.y

src/yyparse.yy: src/yyparse.yy.in $(YFILES)
	@$(CPP) $(YCPPFLAGS) -P -xc $< -o $@
	@sed -i -e 's/^##/#/' $@

clean:
	rm -f cimple obj/*.* obj/gen/*.*
	rm -f src/gen/*

-include init
init: src/gen/sxlex.cc
init: src/gen/shstrs.h
init: src/gen/yylex.cc
init: src/gen/yyparse.cc
init: src/gen/ast.h
init: src/gen/node_kind.h
init: src/gen/forward.h
init: src/gen/visitor_methods.h
init: transform/ast.mli
init: transform/token.ml
init: transform/visit.ml
init: src/gen/rules-tok.y
init: src/gen/tokens-tok.y

-include obj/*.d obj/gen/*.d

check: cimple $(shell find ../aldor/include/aldor ../aldor/src/compiler -name "*.[ch]")
	@echo "running $< on all aldor sources"
	@./$^
