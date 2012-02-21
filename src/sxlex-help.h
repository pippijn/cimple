#include "sxlexer.h"

#define mkKeyword mkKeyword
static yytokentype
mkKeyword (yytokentype tok, YYSTYPE *yylval, YYLTYPE *yylloc)
{
  *yylval = NULL;
  return tok;
}

typedef sxlexer lexer_type;

#include "lex-help.h"
