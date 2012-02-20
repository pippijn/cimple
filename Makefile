SCMLIB := racket/base racket/match

SOURCES :=			\
	src/gen/ast.cc		\
	src/gen/members.cc	\
	src/gen/node_kind.cc	\
	src/gen/traverser.cc	\
	src/gen/yylex.cc	\
	src/gen/yyparse.cc	\
	src/struct/shstr.cc	\
	src/struct/symtab.cc	\
	src/lexer.cc		\
	src/main.cc		\
	src/node.cc		\
	src/parser.cc		\
	src/phase.cc		\
	src/scheme.c		\
	src/shstrs.cc		\
	src/transforms.cc	\
	src/traverser.cc	\
	src/visitor.cc
OBJECTS := $(patsubst src/%,obj/%.o,$(basename $(SOURCES)))

CPPFLAGS := -MD -Isrc -Isrc/gen
CXXFLAGS := -O3 -ggdb3 #-fopenmp

all: cimple xform

.PHONY: xform
xform:
	$(MAKE) -C transform

cimple: $(OBJECTS)
	$(LINK.cc) -o $@ $^ -lracket3m -ldl -lffi -lpthread

obj/%.o: src/%.c
	@echo "  CC   " $<
	@$(COMPILE.c) -o $@ $<

obj/%.o: src/%.cc
	@echo "  CXX  " $<
	@$(COMPILE.cc) -o $@ $<

src/gen/%.cc: src/%.yy
	@echo "  YACC " $<
	@$(YACC) -d -o $@ $<
	@grep -v '^#define' $(@:.cc=.hh) > $(@:.cc=.hh.tmp)
	@mv $(@:.cc=.hh.tmp) $(@:.cc=.hh)

src/gen/%.cc: src/%.ll
	@echo "  LEX  " $<
	@$(LEX) --header-file=$(@:.cc=.h.tmp) -o$@ $<
	@grep -v '^#line' $(@:.cc=.h.tmp) > $(@:.cc=.h.new)
	@(diff $(@:.cc=.h) $(@:.cc=.h.new) || mv $(@:.cc=.h.new) $(@:.cc=.h)) > /dev/null 2>&1
	@$(RM) $(@:.cc=.h).*

src/gen/%.y: src/grammar/%.h $(shell find src/grammar -name "*.y")
	mkdir -p $(@D)
	$(CPP) $(YCPPFLAGS) -P -xc $< -o $@
	sed -i -e 's/^%[%{}]//' $@

src/gen/c.ast: src/gen/rules.y $(wildcard tools/grammar/*)
	tools/grammar/gpp -a $< $@

src/gen/node_kind.h: src/gen/c.ast tools/astgen
	tools/astgen $< -kh $@

src/gen/node_kind.cc: src/gen/c.ast tools/astgen
	tools/astgen $< -kc $@

src/gen/forward.h: src/gen/c.ast tools/astgen
	tools/astgen $< -fwd $@

src/gen/visitor_methods.h: src/gen/c.ast tools/astgen
	tools/astgen $< -vh $@

src/gen/traverser.cc: src/gen/c.ast tools/astgen
	tools/astgen $< -vc $@

src/gen/members.cc: src/gen/c.ast tools/astgen
	tools/astgen $< -r $@

src/gen/ast.h: src/gen/c.ast tools/astgen
	tools/astgen $< -h $@

src/gen/ast.cc: src/gen/c.ast tools/astgen
	tools/astgen $< -c $@

transform/ast.mli: src/gen/c.ast tools/astgen
	tools/astgen $< -mli $@

transform/visit.ml: src/gen/c.ast tools/astgen
	tools/astgen $< -ml $@

src/gen/%-pp.y: src/gen/%.y $(wildcard tools/grammar/*)
	tools/grammar/gpp -y $< $@

src/gen/base.c: Makefile
	raco ctool --c-mods $@ $(foreach l,$(SCMLIB),++lib $l)

src/yyparse.yy: src/yyparse.yy.in src/gen/rules-pp.y src/gen/tokens.y
	$(CPP) $(YCPPFLAGS) -P -xc $< -o $@
	sed -i -e 's/^##/#/' $@

clean:
	$(RM) cimple obj/*.* obj/gen/*.*
	$(RM) src/gen/*

-include init
init: src/gen/yylex.cc
init: src/gen/yyparse.cc
init: src/gen/ast.h
init: src/gen/node_kind.h
init: src/gen/forward.h
init: src/gen/visitor_methods.h
init: src/gen/base.c
init: transform/ast.mli
init: transform/visit.ml

-include obj/*.d obj/gen/*.d

check: cimple $(shell find ../aldor/include/aldor ../aldor/src/compiler -name "*.[ch]")
	@echo "running $< on all aldor sources"
	@./$^
