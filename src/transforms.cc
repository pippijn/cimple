#include "transforms.h"

#include <racket/scheme.h>

extern "C" void declare_modules (Scheme_Env *env);

class transforms
{
  void transform ()
  {
    Scheme_Env *env = scheme_basic_env ();

    Scheme_Object *v = NULL;
    Scheme_Object *curout = NULL;
    Scheme_Config *config = NULL;
    Scheme_Object *a[2] = { NULL, NULL };

    MZ_GC_DECL_REG (5);
    MZ_GC_VAR_IN_REG (0, env);
    MZ_GC_VAR_IN_REG (1, v);
    MZ_GC_VAR_IN_REG (2, curout);
    MZ_GC_VAR_IN_REG (3, config);
    MZ_GC_ARRAY_VAR_IN_REG (4, a, 2);

    MZ_GC_REG ();

    declare_modules (env);

    scheme_namespace_require (scheme_intern_symbol ("racket/base"));

    config = scheme_current_config ();
    curout = scheme_get_param (config, MZCONFIG_OUTPUT_PORT);

    /* load */
    a[0] = scheme_intern_symbol ("racket/base");
    a[1] = scheme_intern_symbol ("load");
    v = scheme_dynamic_require (2, a);

    /* (load "test.scm") */
    a[0] = scheme_make_utf8_string ("transforms.scm");
    v = scheme_apply (v, 1, a);

    scheme_display (v, curout);

    v = scheme_make_char ('\n');
    scheme_display (v, curout);

    MZ_GC_UNREG ();
  }

  static int run (void *data)
  {
    static_cast<transforms *> (data)->transform ();

    return 0;
  }

public:
  transforms (char const *sxfile)
  {
    scheme_main_stack_setup (1, run, this);
  }
};

void
run_transforms (char const *sxfile)
{
  transforms xf (sxfile);
}
