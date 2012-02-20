%%
%%

translation_unit
	: defs:external_definition+
	  { translation_unit }
	;

external_definition
	: :declaration
	| :function_definition
	| :";"
	;

function_definition
	:                                  declarator:function_declarator          body:compound_statement
	  { function_definition }
	| dqual:declaration_qualifier_list declarator:function_declarator          body:compound_statement
	  { function_definition_dqual }
	| tqual:type_qualifier+            declarator:function_declarator          body:compound_statement
	  { function_definition_tqual }
	;

function_declarator
	: :identifier_declarator
	;
