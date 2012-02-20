%%
%%

attributes
	: n1:attribute
	  { attributes370 }
	| n1:attributes n2:attribute
	  { attributes371 }
	;

attribute
	: attribute_tok:"__attribute__" lbrack1:"(" lbrack2:"(" attributes:attrib[","]+ rbrack1:")" rbrack2:")"
	  { attribute }
	;

attrib
	: n1:empty
	  { attrib375 }
	| name:any_word										   %dprec 4
	  { attrib376 }
	| name:any_word lbrack:"(" id:identifier                                        rbrack:")" %dprec 3
	  { attrib377 }
	| name:any_word lbrack:"(" id:identifier comma:"," expr:nonnull_expression_list rbrack:")" %dprec 2
	  { attrib378 }
	| name:any_word lbrack:"("                         expr:nonnull_expression_list rbrack:")" %dprec 1
	  { attrib379 }
	;
