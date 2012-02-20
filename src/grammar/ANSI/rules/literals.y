%%
%%

constant
	: token:TK_FLOATING_CONSTANT
	  { floating_constant }
	| token:TK_INTEGER_CONSTANT
	  { integer_constant }
	| token:TK_OCTAL_CONSTANT
	  { octal_constant }
	| token:TK_HEX_CONSTANT
	  { hex_constant }
	| token:TK_CHAR_CONSTANT
	  { char_constant }
	| token:TK_WCHAR_CONSTANT
	  { wchar_constant }
	;

string_literal
	: token:TK_STRING_LITERAL
	  { string_literal }
	;

type_qualifier
	: const:"const"
	  { const_type_qualifier }
	| volatile:"volatile"
	  { volatile_type_qualifier }
	;

pointer_type_qualifier
	: const:"const"
	  { const_type_qualifier }
	| volatile:"volatile"
	  { volatile_type_qualifier }
	;

storage_class
	: typedef:"typedef"
	  { typedef_str_class_spec }
	| extern:"extern"
	  { extern_str_class_spec }
	| static:"static"
	  { static_str_class_spec }
	| auto:"auto"
	  { auto_str_class_spec }
	| register:"register"
	  { register_str_class_spec }
	;

basic_type_name
	: void:"void"
	  { void_type_spec }
	| char:"char"
	  { char_type_spec }
	| wchar:"wchar_t"
	  { wchar_type_spec }
	| int:"int"
	  { int_type_spec }
	| float:"float"
	  { float_type_spec }
	| double:"double"
	  { double_type_spec }

	| signed:"signed"
	  { signer_type_spec }
	| unsigned:"unsigned"
	  { unsigned_type_spec }

	| short:"short"
	  { short_type_spec }
	| long:"long"
	  { long_type_spec }
	;


identifier
	: token:TK_IDENTIFIER
	  { identifier }
	;

any_word
	: :identifier
	| token:"const"
	  { identifier }
	;

typedef_name
	: token:TK_TYPEDEF_NAME
	  { typedef_name }
	;
