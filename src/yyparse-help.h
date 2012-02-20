#include "parser.h"
#include "ast.h"

#define YYSTYPE YYSTYPE

/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
 * If N is 0, then set CURRENT to the empty location which ends
 * the previous symbol: RHS[0] (always defined).  */
#define YYLLOC_DEFAULT(Current, Rhs, N)					\
    do {								\
      (Current) = YYRHSLOC (Rhs, 1);					\
      if (YYID (N))							\
	{								\
	  (Current)              = YYRHSLOC (Rhs, 1);			\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).file         = YYRHSLOC (Rhs, 0).file;		\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    } while (YYID (0))

/* YY_LOCATION_PRINT -- Print the location on the stream. */
static void
YY_LOCATION_PRINT (FILE *file, YYLTYPE const &loc)
{
  fprintf (file, "%d.%d-%d.%d",
           loc.first_line, loc.first_column, loc.last_line, loc.last_column);
}
#define YY_LOCATION_PRINT YY_LOCATION_PRINT

static yytokentype
yylex (YYSTYPE *yylval, YYLTYPE *yylloc, parser *self)
{
  return self->lex.lex (yylval, yylloc);
}
