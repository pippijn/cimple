%%
%%

statement
	: :labeled_statement
	| :compound_statement
	| :expression_statement
	| :selection_statement
	| :iteration_statement
	| :jump_statement
	| :declaration
	;

labeled_statement
	: label:identifier semi:":"
	  { label_statement }
	| case:"case" expr:constant_expression semi:":"
	  { case_label_statement }
	| default:"default" semi:":"
	  { default_label_statement }
	;

compound_statement
	: lbrace:"{"                  rbrace:"}"
	  { compound_statement }
	| lbrace:"{" stmts:statement+ rbrace:"}"
	  { compound_statement }
	;


expression_statement
	: expr:expression? semi:";"
	  { expression_statement }
	;

selection_statement
	: if:"if" lbrack:"(" cond:expression rbrack:")" then_stmt:statement %prec SHIFT_THERE
	  { if_statement }
	| if:"if" lbrack:"(" cond:expression rbrack:")" then_stmt:statement else:"else" else_stmt:statement
	  { if_statement }
	| switch:"switch" lbrack:"(" expr:expression rbrack:")" stmt:statement
	  { switch_statement }
	;

iteration_statement
	: while:"while" lbrack:"(" cond:expression rbrack:")" stmt:statement
	  { while_statement }
	| do:"do" stmt:statement while:"while" lbrack:"(" cond:expression rbrack:")" semi:";"
	  { do_statement }
	| for:"for" lbrack:"(" init:expression? init_semi:";" cond:expression? cond_semi:";" inc:expression? rbrack:")" stmt:statement
	  { for_statement }
	;

jump_statement
	: goto:"goto" label:identifier semi:";"
	  { goto_statement }
	| continue:"continue" semi:";"
	  { continue_statement }
	| break:"break" semi:";"
	  { break_statement }
	| return:"return" expr:expression? semi:";"
	  { return_statement }
	;
