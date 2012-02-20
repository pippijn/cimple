%%
%%

external_definition
	: :line_directive
	;

line_directive
	: hash:"#" line:TK_INTEGER_CONSTANT file:TK_STRING_LITERAL
	  { line_directive }
	| hash:"#" line:TK_INTEGER_CONSTANT file:TK_STRING_LITERAL level:TK_INTEGER_CONSTANT
	  { line_directive }
	;
