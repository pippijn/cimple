#include <cctype>
#include <cstdarg>
#include <cstdio>

struct emit
  : phase
{
  FILE *fh;
  char const *file;
  int last_line;
  int last_column;
  bool last_needs_space;

  static int const MAX_NEWLINES = 5;

  emit ()
    : fh (stdout)
    , file (NULL)
    , last_line (0)
    , last_column (0)
    , last_needs_space (false)
  {
  }

  ~emit ()
  {
    puts ("");
  }

  static bool needs_space (yytokentype tok)
  {
    switch (tok)
      {
      case KW_ALIGNOF:
      case KW_ASM:
      case KW_ATTRIBUTE:
      case KW_AUTO:
      case KW_BREAK:
      case KW_CASE:
      case KW_CHAR:
      case KW_COMPLEX:
      case KW_CONST:
      case KW_CONTINUE:
      case KW_DEFAULT:
      case KW_DO:
      case KW_DOUBLE:
      case KW_ELSE:
      case KW_ENUM:
      case KW_EXTENSION:
      case KW_EXTERN:
      case KW_FLOAT:
      case KW_FOR:
      case KW_GOTO:
      case KW_IF:
      case KW_IMAG:
      case KW_INLINE:
      case KW_INT:
      case KW_LONG:
      case KW_REAL:
      case KW_REGISTER:
      case KW_RESTRICT:
      case KW_RETURN:
      case KW_SHORT:
      case KW_SIGNED:
      case KW_SIZEOF:
      case KW_STATIC:
      case KW_STRUCT:
      case KW_SWITCH:
      case KW_TYPEDEF:
      case KW_TYPEOF:
      case KW_UNION:
      case KW_UNSIGNED:
      case KW_VA_ARG:
      case KW_VA_LIST:
      case KW_VOID:
      case KW_VOLATILE:
      case KW_WCHAR_T:
      case KW_WHILE:
      case TK_FLOATING_CONSTANT:
      case TK_HEX_CONSTANT:
      case TK_IDENTIFIER:
      case TK_INTEGER_CONSTANT:
      case TK_OCTAL_CONSTANT:
      case TK_TYPEDEF_NAME:
        return true;
      }

    return false;
  }

  void newline ()
  {
    last_column = 1;
    last_line++;
    last_needs_space = false;

    std::fputc ('\n', fh);
  }

  template<size_t N>
  void print (char const (&str)[N])
  {
    last_column += N - 1;
    last_needs_space = isalnum (str[N - 1]);

    std::fwrite (str, 1, N - 1, fh);
  }

  void print (shstr lexeme)
  {
    last_column += lexeme.length ();
    last_needs_space = isalnum (lexeme[lexeme.length () - 1]);

    std::fwrite (lexeme.data (), 1, lexeme.length (), fh);
  }

  template<size_t N>
  void printf (char const (&fmt)[N], ...)
  {
    va_list ap;
    va_start (ap, fmt);
    last_column += std::vfprintf (fh, fmt, ap);
    va_end (ap);
  }

  void adjust (location const &loc)
  {
    if (file != loc.file || loc.first_line - last_line > MAX_NEWLINES)
      {
        file = loc.file;
        last_line = loc.first_line;

        printf ("\n# %d \"%s\"\n", last_line, file);

        last_column = 1;
      }

    while (last_line < loc.first_line)
      newline ();

    while (last_column < loc.first_column)
      print (" ");
  }

  node_ptr visit (token &n)
  {
    adjust (n.loc);

    bool token_needs_space = needs_space (n.tok);
    if (last_needs_space && token_needs_space)
      print (" ");
    last_needs_space = token_needs_space;

    print (n.lexeme);

    return &n;
  }
};
