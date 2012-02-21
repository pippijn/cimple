#include "node.h"
#include "shstrs.h"

#define yyterminate() return TK_EOF

#define YY_USER_ACTION					\
  {							\
    update_lloc (yylloc, yylineno, yycolumn, yyleng);	\
    if (*yytext == '\n')				\
      yycolumn = 1;					\
    else						\
      yycolumn += yyleng;				\
  }

#define YY_USER_INIT		\
  {				\
    *yylval = NULL;		\
    *yylloc = location ();	\
    yylloc->file = file;	\
  }

#define PUSH(STATE)	yy_push_state (STATE, yyscanner)
#define POP()		yy_pop_state (yyscanner)

#define BACKTRACK(N) do {		\
  yycolumn -= yyleng - N;		\
  yyless (N);				\
} while (0)

#define YY_DECL yytokentype lexer_type::lex (YYSTYPE *yylval_param, YYLTYPE *yylloc_param)


#ifndef mkKeyword
static yytokentype
mkKeyword (yytokentype tok, YYSTYPE *yylval, YYLTYPE *yylloc)
{
  shstr const &lexeme = shstrs[tok];
  assert (!lexeme.empty ());
  *yylval = new token (*yylloc, tok, lexeme);
  return tok;
}
#endif

#ifndef mkToken
static yytokentype
mkToken (yytokentype tok, YYSTYPE *yylval, YYLTYPE *yylloc, char const *text, size_t leng)
{
  assert (leng > 0);
  *yylval = new token (*yylloc, tok, text, leng);
  return tok;
}
#endif

static yytokentype
mkToken (yytokentype tok, YYSTYPE *yylval, YYLTYPE *yylloc, std::string const &lexeme)
{
  return mkToken (tok, yylval, yylloc, lexeme.data (), lexeme.length ());
}

#define Keyword(TOK)		return mkKeyword (KW_##TOK, yylval, yylloc)
#define Punctuation(TOK)	return mkKeyword (TK_##TOK, yylval, yylloc)

#define Token(TOK)					\
  do {							\
    if (!text.empty ())					\
      return mkToken (TK_##TOK, yylval, yylloc, text);	\
    return mkToken (TK_##TOK, yylval, yylloc,		\
                    yytext, yyleng);			\
  } while (0)
