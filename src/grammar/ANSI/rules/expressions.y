%%
%%

primary_expression
	: :identifier
	| :constant
	| :string_literal+
	| lbrack:"(" expr:expression rbrack:")"
	  { bracket_expression }
	;

postfix_expression
	: :primary_expression
	| lhs:postfix_expression lsqbrack:"[" rhs:expression rsqbrack:"]"
	  { array_access }
	| lhs:postfix_expression lbrack:"("                                  rbrack:")"
	  { function_call }
	| lhs:postfix_expression lbrack:"(" args:assignment_expression[","]+ rbrack:")"
	  { function_call }
	| lhs:postfix_expression op:"." member:identifier
	  { struct_access }
	| lhs:postfix_expression op:"->" member:identifier
	  { pointer_access }
	| lhs:postfix_expression op:"." member:typedef_name
	  { struct_access }
	| lhs:postfix_expression op:"->" member:typedef_name
	  { pointer_access }
	| expr:postfix_expression op:"++"
	  { post_increment }
	| expr:postfix_expression op:"--"
	  { post_decrement }
	;

unary_expression
	: :postfix_expression
	| op:"++" expr:unary_expression
	  { pre_increment }
	| op:"--" expr:unary_expression
	  { pre_decrement }
	| op:"&" expr:cast_expression
	  { address_of }
	| op:"*" expr:cast_expression
	  { pointer_dereference }
	| op:"+" expr:cast_expression
	  { positive }
	| op:"-" expr:cast_expression
	  { negate }
	| op:"~" expr:cast_expression
	  { bitwise_negate }
	| op:"!" expr:cast_expression
	  { logical_not }
	| op:"sizeof" expr:unary_expression
	  { sizeof_var }
	| op:"sizeof" lbrack:"(" expr:type_name rbrack:")"
	  { sizeof_type }
	;

cast_expression
	: :unary_expression
	| lbrack:"(" type:type_name rbrack:")" init_list:bracketed_initialiser_list
	  { compound_literal }
	| lbrack:"(" type:type_name rbrack:")" expr:cast_expression
	  { type_cast }
	;

multiplicative_expression
	: :cast_expression
	| lhs:multiplicative_expression op:"*" rhs:cast_expression
	  { multiply }
	| lhs:multiplicative_expression op:"/" rhs:cast_expression
	  { divide }
	| lhs:multiplicative_expression op:"%" rhs:cast_expression
	  { modulo }
	;

additive_expression
	: :multiplicative_expression
	| lhs:additive_expression op:"+" rhs:multiplicative_expression
	  { add }
	| lhs:additive_expression op:"-" rhs:multiplicative_expression
	  { subtract }
	;

shift_expression
	: :additive_expression
	| lhs:shift_expression op:"<<" rhs:additive_expression
	  { shift_left }
	| lhs:shift_expression op:">>" rhs:additive_expression
	  { shift_right }
	;

relational_expression
	: :shift_expression
	| lhs:relational_expression op:"<" rhs:shift_expression
	  { less_than }
	| lhs:relational_expression op:">" rhs:shift_expression
	  { greater_than }
	| lhs:relational_expression op:"<=" rhs:shift_expression
	  { less_than_equals }
	| lhs:relational_expression op:">=" rhs:shift_expression
	  { greater_than_equals }
	;

equality_expression
	: :relational_expression
	| lhs:equality_expression op:"==" rhs:relational_expression
	  { equals }
	| lhs:equality_expression op:"!=" rhs:relational_expression
	  { not_equals }
	;

and_expression
	: :equality_expression
	| lhs:and_expression op:"&" rhs:equality_expression
	  { bitwise_and }
	;

exclusive_or_expression
	: :and_expression
	| lhs:exclusive_or_expression op:"^" rhs:and_expression
	  { bitwise_xor }
	;

inclusive_or_expression
	: :exclusive_or_expression
	| lhs:inclusive_or_expression op:"|" rhs:exclusive_or_expression
	  { bitwise_or }
	;

logical_and_expression
	: :inclusive_or_expression
	| lhs:logical_and_expression op:"&&" rhs:inclusive_or_expression
	  { logical_and }
	;

logical_or_expression
	: :logical_and_expression
	| lhs:logical_or_expression op:"||" rhs:logical_and_expression
	  { logical_or }
	;

conditional_expression
	: :logical_or_expression
	| cond:logical_or_expression qmark:"?" then_expr:expression colon:":" else_expr:conditional_expression
	  { ternary_op }
	| cond:logical_or_expression qmark:"?"                      colon:":" else_expr:conditional_expression
	  { ternary_op }
	;

assignment_expression
	: :conditional_expression
	| lhs:cast_expression op:"=" rhs:assignment_expression
	  { assign }
	| lhs:cast_expression op:"*=" rhs:assignment_expression
	  { multiply_assign }
	| lhs:cast_expression op:"/=" rhs:assignment_expression
	  { divide_assign }
	| lhs:cast_expression op:"%=" rhs:assignment_expression
	  { modulo_assign }
	| lhs:cast_expression op:"+=" rhs:assignment_expression
	  { add_assign }
	| lhs:cast_expression op:"-=" rhs:assignment_expression
	  { subtract_assign }
	| lhs:cast_expression op:"<<=" rhs:assignment_expression
	  { left_shift_assign }
	| lhs:cast_expression op:">>=" rhs:assignment_expression
	  { right_shift_assign }
	| lhs:cast_expression op:"&=" rhs:assignment_expression
	  { and_assign }
	| lhs:cast_expression op:"^=" rhs:assignment_expression
	  { xor_assign }
	| lhs:cast_expression op:"|=" rhs:assignment_expression
	  { or_assign }
	;

expression
	: exprs:assignment_expression[","]+
	  { comma_expression }
	;

constant_expression
	: :conditional_expression
	;
