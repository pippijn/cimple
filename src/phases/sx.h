struct sx
  : phase
{
  size_t indent_level;
  FILE *fh;

  static size_t const indent_step = 1;

  void   indent () { indent_level += indent_step; }
  void unindent () { indent_level -= indent_step; }

  sx (char const *file)
    : indent_level (0)
    , fh (fopen (file, "w"))
  {
  }

  ~sx ()
  {
    fputc ('\n', fh);
    fclose (fh);
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
    size_t len = s.length ();
    bool quoted = false;
    std::string o;
    o.reserve (len * 2);
    for (size_t i = 0; i < len; i++)
      switch (char c = s[i])
        {
        case '"':
          quoted = true;
          o += "\\\"";
          break;
        case '\\':
          quoted = true;
          o += "\\\\";
          break;
        case ' ':
        case ';':
        case '(':
        case ')':
          quoted = true;
        default:
          o += c;
          break;
        }
    if (quoted)
      fputc ('"', fh);
    fputs (o.c_str (), fh);
    if (quoted)
      fputc ('"', fh);
  }

  void print (generic_node &n, char const *type)
  {
    if (indent_level == 0)
      fprintf (fh, "(%s ", type);
    else
      fprintf (fh, "\n%*s(%s ", indent_level, "", type);
    print (fh, n.loc);

    indent ();
    foreach (node_ptr const &p, n.children)
      resume (p) || fprintf (fh, "\n%*sNIL", indent_level, "");
    unindent ();

    fprintf (fh, ")");
  }

  node_ptr visit (generic_node &n)
  {
    print (n, type (n));
    return &n;
  }

  node_ptr visit (node_list &n)
  {
    print (n, "ast_list");
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
    fprintf (fh, "\n%*s(%s ", indent_level, "", type (n));
    print (fh, n.loc);
    fprintf (fh, " %s ", token_kind_name (n.tok));
    print (fh, n.lexeme);
    fprintf (fh, ")");

    return &n;
  }
};
