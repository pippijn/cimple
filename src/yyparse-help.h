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

static shstr
get_shstr (node_ptr n)
{
  shstr s = n->as<token> ().lexeme;
  std::string o;
  o.reserve (s.length ());
  for (char const *i = s.c_str (), *e = s.c_str () + s.length (); i != e; ++i)
    switch (*i)
      {
      case '"':
        break;
      case '\\':
        ++i;
      default:
        o += *i;
      }
  return shstr (o.data (), o.length ());
}

static char const *
get_string (node_ptr n)
{
  return get_shstr (n).c_str ();
}

static int
get_int (node_ptr n)
{
  return strtol (get_string (n), NULL, 10);
}
