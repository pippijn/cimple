#pragma once

#include "ylcode.h"

struct lexer
{
  lexer (char const *file);
  lexer (char const *file, FILE *fh);
  lexer (char const *file, std::string const &s);
  ~lexer ();

  yytokentype lex (node **yylval, location *yylloc);
  void update_lloc (YYLTYPE *yylloc, int lineno, int column, int leng);

  yyscan_t yyscanner;
  char const *file;
  std::string text;
  bool own;
};
