%%
%%

type_qualifier
	: n1:"inline"
	  { inline_type_qualifier }
	| n1:"restrict"
	  { restrict_type_qualifier }
	| n1:"complex"
	  { complex_type_qualifier }
	;

pointer_type_qualifier
	: n1:"restrict"
	  { restrict_pointer_type_qualifier }
	;
