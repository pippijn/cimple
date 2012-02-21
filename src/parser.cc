#include "parser.h"

#include <iostream>

parser::parser (lexer &lex)
  : lex (lex)
{
}

parser::~parser ()
{
}


node_ptr
parser::operator () ()
{
  extern int yyparse (parser *parse);
  yyparse (this);
  return unit;
}


void
yyerror (YYLTYPE const *llocp, parser *parser, char const *msg)
{
  if (FILE *fh = fopen (llocp->file, "r"))
    {
      char *line = 0;
      size_t leng = 0;
      for (int i = 0; i < llocp->first_line; i++)
        getline (&line, &leng, fh);
      if (line)
        {
          printf ("%s", line);
          printf ("%*s\n", llocp->first_column, "^");
          free (line);
        }
      fclose (fh);
    }
  printf ("%s:%d:%d: error: %s\n", llocp->file, llocp->first_line, llocp->first_column, msg);
  exit (1);
}
