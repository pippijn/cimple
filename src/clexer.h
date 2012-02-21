#pragma once

#include "lexer.h"

struct clexer
  : lexer
{
  clexer (char const *file);
  clexer (char const *file, FILE *fh);
  clexer (char const *file, std::string const &s);
  ~clexer ();

  yytokentype lex (node **yylval, location *yylloc);
};
