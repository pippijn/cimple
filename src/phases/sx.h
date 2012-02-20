#include "transforms.h"

struct sx
  : phase
{
  size_t indent_level;
  FILE *fh;

  static size_t const indent_step = 1;

  void   indent () { indent_level += indent_step; }
  void unindent () { indent_level -= indent_step; }

  sx ()
    : indent_level (0)
    , fh (fopen ("test.scm", "w"))
  {
  }

  ~sx ()
  {
    fputc ('\n', fh);
    fclose (fh);

    run_transforms ("test.scm");
  }

  static void print (FILE *fh, location const &loc)
  {
    fprintf (fh, "(loc (%d %d) (%d %d) \"%s\")",
             loc.first_line,
             loc.first_column,
             loc.last_line,
             loc.last_column,
             loc.file);
  }

  static void print (FILE *fh, shstr s)
  {
    for (size_t i = 0; i < s.length (); i++)
      switch (char c = s[i])
        {
        case '"':
          fputs ("\\\"", fh);
          break;
        default:
          fputc (c, fh);
          break;
        }
  }

  node_ptr visit (generic_node &n)
  {
    if (indent_level == 0)
      {
        fprintf (fh, "'(%s ", type (n));
        indent ();
      }
    else
      {
        fprintf (fh, "\n%*s(%s ", indent_level, "", type (n));
      }
    print (fh, n.loc);

    indent ();
    foreach (node_ptr const &p, n.children)
      resume (p) || fprintf (fh, "\n%*sNIL", indent_level, "");
    unindent ();

    fprintf (fh, ")");
    return &n;
  }

  node_ptr visit (ambiguity &n)
  {
    fprintf (fh, "\n%*s(%s ", indent_level, "", type (n));
    print (fh, n.loc);

    indent ();

    resume (n.a) || fprintf (fh, "\n%*sNIL", indent_level, "");
    resume (n.b) || fprintf (fh, "\n%*sNIL", indent_level, "");

    unindent ();

    fprintf (fh, ")");
    return &n;
  }

  node_ptr visit (token &n)
  {
    fprintf (fh, "\n%*s(%s %d \"", indent_level, "", type (n), n.tok);
    print (fh, n.lexeme);
    fprintf (fh, "\" ");
    print (fh, n.loc);
    fprintf (fh, ")");

    return &n;
  }
};
