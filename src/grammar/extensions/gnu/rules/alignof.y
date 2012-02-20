%%
%%

unary_expression
	: alignof_tok:"alignof" expr:unary_expression
	  { alignof_var }
	| alignof_tok:"alignof" lbrack:"(" type:type_name rbrack:")"
	  { alignof_type }
	;
