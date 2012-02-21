#pragma once

#include <cstddef>
#include <string>

typedef struct node *YYSTYPE;
typedef struct location YYLTYPE;
#define YYSTYPE YYSTYPE
#define YYLTYPE YYLTYPE
#include "yyparse.hh"
#ifndef FLEX_SCANNER
#include "yylex.h"
#endif

struct parser;

void yyerror (YYLTYPE const *llocp, parser *parse, char const *msg);
char const *tokname (short yytoken);
char const *token_kind_name (yytokentype kind);
