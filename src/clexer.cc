#include "clexer.h"

clexer::clexer (char const *file)
  : lexer (file)
{
}

clexer::clexer (char const *file, FILE *fh)
  : lexer (file, fh)
{
}

clexer::clexer (char const *file, std::string const &s)
  : lexer (file, s)
{
}

clexer::~clexer ()
{
}
