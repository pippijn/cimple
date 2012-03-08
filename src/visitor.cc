#include "traverser.h"
#include "node.h"
#include "ast.h"

using namespace ast;

#include "phase.h"
#include "phases/emit.h"
#include "phases/flatten_list.h"
#include "phases/flatten_opt.h"
#include "phases/graph.h"
#include "phases/insert_syms.h"
#include "phases/sx.h"

template<typename T>
static void
phase (node_ptr unit)
{
  T visitor;
  unit->accept (visitor);
}

template<typename T, typename ExtraArg>
static void
phase (node_ptr unit, ExtraArg arg)
{
  T visitor (arg);
  unit->accept (visitor);
}

void
compile (node_ptr unit)
{
  return;
  phase<flatten_opt> (unit);
  phase<flatten_list> (unit);

  puts ("writing s-expressions");
  phase<sx> (unit, "test.scm");
  puts ("running transforms");
  system ("./xform > output.scm");
  puts ("reading back s-expressions");
  if (!(unit = ast_of_sexpr ("output.scm")))
    return;

  phase<insert_syms> (unit);
  //phase<graph> (unit);
  phase<emit> (unit);
}
