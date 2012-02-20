#include "config.h"

#include <clocale>
#include <cstdlib>

#include <sys/time.h>

#include "lexer.h"
#include "parser.h"

#include <valgrind/callgrind.h>

template<size_t N>
static int
strncmp (char const *a, char const (&b)[N])
{
  return strncmp (a, b, N - 1);
}

int
main (int argc, char *argv[])
{
  if (argc < 2)
    return EXIT_FAILURE;

  if (!strcmp (argv[1], "--version"))
    {
      puts (PACKAGE_NAME " v" PACKAGE_VERSION);
      return EXIT_SUCCESS;
    }

  if (!strcmp (argv[1], "--help"))
    {
      puts ("usage: " PACKAGE_NAME " <file>");
      return EXIT_SUCCESS;
    }

  setlocale (LC_ALL, "");

  shstr::init_shstrs ();

#if 0
  extern int yydebug;
  yydebug = 1;
#endif

  timeval start;
  gettimeofday (&start, NULL);

  size_t bytes = 0;
  for (int i = 1; i < argc; i++)
    {
      char const *file = argv[i];

      if (strncmp (file, "../aldor/src/compiler/struct/fint/") == 0)
        continue;
      if (strcmp (file, "../aldor/src/compiler/phases/gencpp.c") == 0)
        continue;
      if (strcmp (file, "../aldor/src/compiler/struct/foam/fm-access.c") == 0)
        continue;
      if (strcmp (file, "../aldor/src/compiler/struct/foam/fm-new.c") == 0)
        continue;
      if (strcmp (file, "") == 0)
        continue;

      printf ("processing %s\n", file);

      char cmd[1024];
      snprintf (cmd, sizeof cmd,
                "gcc -xc -E -nostdinc "
                "-Istdinc "
                "-I../aldor/include "
                "-I../aldor/_build "
                "-I../aldor/_build/include "
                "-DHAVE_CONFIG_H "
                "-DCIMPLE "
                "-DPKGLIBEXECDIR='\"\"' "
                "%s", file);

      FILE *fh = popen (cmd, "r");
      std::string preprocessed;
      while (!feof (fh))
        preprocessed.append (cmd, fread (cmd, 1, sizeof cmd, fh));
      pclose (fh);

      bytes += preprocessed.length ();

#if 0
      fprintf (stderr, "%s\n", preprocessed.c_str ());
#endif

      lexer lex (file, preprocessed);
#if 0
      {
        node *doc = NULL;
        location loc;
        while (int tok = lex.lex (&doc, &loc))
          {
#if 0
            printf ("%s\n", token_name (tok));
#endif
            if (tok == TK_ERROR)
              {
                printf ("lexical error: '%s'\n", doc->as<token> ().lexeme.c_str ());
                delete doc;
                return EXIT_FAILURE;
              }
            delete doc;
            doc = NULL;
          }
        continue;
      }
#endif

      parser parse (lex);

      CALLGRIND_START_INSTRUMENTATION;
      if (node_ptr doc = parse ())
        compile (doc);
      CALLGRIND_STOP_INSTRUMENTATION;
    }

  timeval end;
  gettimeofday (&end, NULL);

  timeval diff;
  timersub (&end, &start, &diff);

  double elapsed = diff.tv_sec + double (diff.tv_usec) / 1000000;
  printf ("processed %lu KiB, %'lu nodes in %.2f sec (%.2f MiB/sec, %.2fK nodes/sec)\n",
          bytes / 1024,
          node::node_count,
          elapsed,
          bytes / elapsed / 1024 / 1024,
          node::node_count / elapsed / 1000);

  return EXIT_SUCCESS;
}
