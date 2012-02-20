%%
%%

unary_expression
	: va_arg_op:"va_arg" lbrack:"(" expr:assignment_expression comma:"," type:type_name rbrack:")"
	  { va_arg_expression }
	;

basic_type_name
	: n1:"va_list"
	  { va_list_type_spec }
	;
