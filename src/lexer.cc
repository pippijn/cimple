#include "lexer.h"
#include "location.h"

#include <cassert>
#include <climits>

void yyset_column (int column_no, yyscan_t yyscanner);

lexer::lexer (char const *file)
  : file (file)
  , own (true)
{
  yylex_init_extra (this, &yyscanner);

  FILE *fh = fopen (file, "r");
  if (!fh)
    throw;

  yyset_in (fh, yyscanner);
}

lexer::lexer (char const *file, FILE *fh)
  : file (file)
  , own (false)
{
  yylex_init_extra (this, &yyscanner);

  if (!fh)
    throw;

  yyset_in (fh, yyscanner);
}

lexer::lexer (char const *file, std::string const &s)
  : file (file)
  , own (false)
{
  yylex_init_extra (this, &yyscanner);

  if (s.empty ())
    throw;

  yy_scan_bytes (s.data (), s.length (), yyscanner);
  yyset_lineno (1, yyscanner);
  yyset_column (0, yyscanner);
}

lexer::~lexer ()
{
  if (own)
    fclose (yyget_in (yyscanner));
  yylex_destroy (yyscanner);
}

void
lexer::update_lloc (YYLTYPE *yylloc, int lineno, int column, int leng)
{
  assert (yylloc != NULL);
  assert (lineno >= 0);
  assert (column >= 0);
  assert (leng >= 1);
  assert (UINT_MAX - column - leng > INT_MAX);

  yylloc->file = file;
  yylloc->first_line = lineno;
  yylloc->first_column = column;
  yylloc->last_column = column + leng;
  yylloc->last_line = lineno;
}
