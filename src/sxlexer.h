#pragma once

#include "lexer.h"

struct sxlexer
  : lexer
{
  sxlexer (char const *file);
  sxlexer (char const *file, FILE *fh);
  sxlexer (char const *file, std::string const &s);
  ~sxlexer ();

  yytokentype lex (node **yylval, location *yylloc);
};
