%{
#include "yylex-help.h"
%}

%option prefix="yy"
%option bison-locations
%option reentrant
%option yylineno
%option noyywrap nounput noinput nounistd
%option never-interactive
%option stack

%x COMMENT PREPROC

D			[0-9]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

WS			[ \t\v\n\r\f]

IDENTIFIER		[a-z_][a-zA-Z0-9_]*
TYPEDEF_NAME		[A-Z]+[a-z0-9][a-zA-Z0-9]*
CONSTANT		[A-Z][a-zA-Z0-9]*"_"[a-zA-Z0-9_]+

DSTRING			\"(\\.|[^\\"])*\"
SSTRING			'(\\.|[^\\'])+'

%%
 /* known identifiers */
[A-Z]				{ Token (IDENTIFIER); }
[A-Z][A-Za-z0-9]		{ Token (IDENTIFIER); }
[ST]("arg"|"syme"|"ret"|"norm"|"symes"|"conds")	{ Token (IDENTIFIER); }
"TScope"			{ Token (IDENTIFIER); }
"E"[A-Z]+			{ Token (IDENTIFIER); }
"SIG"[A-Z]+			{ Token (IDENTIFIER); }

 /* known typedef names */
"mpz_t"				{ Token (TYPEDEF_NAME); }
"c_sighandler_t"		{ Token (TYPEDEF_NAME); }

"FILE"				{ Token (TYPEDEF_NAME); }
"boolean"			{ Token (TYPEDEF_NAME); }
"jmp_buf"			{ Token (TYPEDEF_NAME); }
"size_t"			{ Token (TYPEDEF_NAME); }
"ptrdiff_t"			{ Token (TYPEDEF_NAME); }
"va_arg"			{ Keyword (VA_ARG); }
"va_list"			{ Keyword (VA_LIST); }
"uint8_t"			{ Token (TYPEDEF_NAME); }
"uint16_t"			{ Token (TYPEDEF_NAME); }
"uint32_t"			{ Token (TYPEDEF_NAME); }
"uint64_t"			{ Token (TYPEDEF_NAME); }
"int8_t"			{ Token (TYPEDEF_NAME); }
"int16_t"			{ Token (TYPEDEF_NAME); }
"int32_t"			{ Token (TYPEDEF_NAME); }
"int64_t"			{ Token (TYPEDEF_NAME); }


"__attribute__"			{ Keyword (ATTRIBUTE); }
"__builtin_va_arg"		{ Keyword (VA_ARG); }
"__builtin_va_list"		{ Keyword (VA_LIST); }
"__const"			{ Keyword (CONST); }
"__restrict"			{ Keyword (RESTRICT); }
"__asm__"			{ Keyword (ASM); }
"_Complex"			{ Keyword (COMPLEX); }
"__extension__"			{ Keyword (EXTENSION); }

"char"				{ Keyword (CHAR); }
"double"			{ Keyword (DOUBLE); }
"int"				{ Keyword (INT); }
"long"				{ Keyword (LONG); }
"short"				{ Keyword (SHORT); }
"signed"			{ Keyword (SIGNED); }
"unsigned"			{ Keyword (UNSIGNED); }
"void"				{ Keyword (VOID); }

"auto"				{ Keyword (AUTO); }
"break"				{ Keyword (BREAK); }
"case"				{ Keyword (CASE); }
"const"				{ Keyword (CONST); }
"continue"			{ Keyword (CONTINUE); }
"default"			{ Keyword (DEFAULT); }
"do"				{ Keyword (DO); }
"else"				{ Keyword (ELSE); }
"enum"				{ Keyword (ENUM); }
"extern"			{ Keyword (EXTERN); }
"float"				{ Keyword (FLOAT); }
"for"				{ Keyword (FOR); }
"goto"				{ Keyword (GOTO); }
"if"				{ Keyword (IF); }
"register"			{ Keyword (REGISTER); }
"return"			{ Keyword (RETURN); }
"sizeof"			{ Keyword (SIZEOF); }
"static"			{ Keyword (STATIC); }
"struct"			{ Keyword (STRUCT); }
"switch"			{ Keyword (SWITCH); }
"typedef"			{ Keyword (TYPEDEF); }
"union"				{ Keyword (UNION); }
"volatile"			{ Keyword (VOLATILE); }
"while"				{ Keyword (WHILE); }

{IDENTIFIER}			{ Token (IDENTIFIER); }
{CONSTANT}			{ Token (IDENTIFIER); }
{TYPEDEF_NAME}			{ Token (TYPEDEF_NAME); }

0[xX]{H}+{IS}?			{ Token (HEX_CONSTANT); }
0{D}+{IS}?			{ Token (OCTAL_CONSTANT); }
{D}+{IS}?			{ Token (INTEGER_CONSTANT); }

{D}+{E}{FS}?			{ Token (FLOATING_CONSTANT); }
{D}*"."{D}+({E})?{FS}?		{ Token (FLOATING_CONSTANT); }
{D}+"."{D}*({E})?{FS}?		{ Token (FLOATING_CONSTANT); }

{SSTRING}			{ Token (CHAR_CONSTANT); }
{DSTRING}			{ Token (STRING_LITERAL); }
L{SSTRING}			{ Token (WCHAR_CONSTANT); }
L{DSTRING}			{ Token (WSTRING_LITERAL); }

","				{ Punctuation (COMMA); }
"..."				{ Punctuation (ELLIPSIS); }
">>"				{ Punctuation (GTGT); }
">>="				{ Punctuation (GTGT_EQ); }
"<<"				{ Punctuation (LTLT); }
"<<="				{ Punctuation (LTLT_EQ); }
"+"				{ Punctuation (PLUS); }
"+="				{ Punctuation (PLUS_EQ); }
"-"				{ Punctuation (MINUS); }
"-="				{ Punctuation (MINUS_EQ); }
"*"				{ Punctuation (STAR); }
"*="				{ Punctuation (STAR_EQ); }
"/"				{ Punctuation (SLASH); }
"/="				{ Punctuation (SLASH_EQ); }
"%"				{ Punctuation (PERCENT); }
"%="				{ Punctuation (PERCENT_EQ); }
"&"				{ Punctuation (AND); }
"&="				{ Punctuation (AND_EQ); }
"^"				{ Punctuation (CARET); }
"^="				{ Punctuation (CARET_EQ); }
"|"				{ Punctuation (PIPE); }
"|="				{ Punctuation (PIPE_EQ); }
"<"				{ Punctuation (LESS); }
"<="				{ Punctuation (LESS_EQ); }
">"				{ Punctuation (GREATER); }
">="				{ Punctuation (GREATER_EQ); }
"="				{ Punctuation (EQUALS); }
"=="				{ Punctuation (EQEQ); }
"!="				{ Punctuation (NE); }

"&&"				{ Punctuation (ANDAND); }
"||"				{ Punctuation (PIPEPIPE); }
"++"				{ Punctuation (INC); }
"--"				{ Punctuation (DEC); }

"->"				{ Punctuation (ARROW); }
"."				{ Punctuation (PERIOD); }

"!"				{ Punctuation (EXMARK); }
"~"				{ Punctuation (TILDE); }
";"				{ Punctuation (SEMICOLON); }
":"				{ Punctuation (COLON); }
"?"				{ Punctuation (QMARK); }

"("				{ Punctuation (LBRACK); }
")"				{ Punctuation (RBRACK); }
"{"				{ Punctuation (LBRACE); }
"}"				{ Punctuation (RBRACE); }
"["				{ Punctuation (LSQBRACK); }
"]"				{ Punctuation (RSQBRACK); }

<INITIAL,COMMENT>{
	"/*"			{ text.append (yytext, yyleng); PUSH (COMMENT); }
}
<COMMENT>{
	([^*]+|"*")		{ text.append (yytext, yyleng); }
	"*/"			{ text.append (yytext, yyleng); POP (); if (YY_START == INITIAL) Token (COMMENT); }
}

^"%include <"[^>]+">"		{ yytext[0] = '#'; Token (INCLUDE); }
^"# "[0-9]+" "			{ yylineno = strtol (yytext + 2, NULL, 10) - 1; PUSH (PREPROC); }
<PREPROC>{
	"pragma".*		{ }
	[0-9]+			{ }
	{DSTRING}		{ file = shstr (yytext + 1, yyleng - 2).c_str (); }
	\n			{ POP (); }
	{WS}			{ }
}

{WS}				{ }
<*>.				{ Token (ERROR); }
%%
