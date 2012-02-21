#include "sxlexer.h"

sxlexer::sxlexer (char const *file)
  : lexer (file)
{
}

sxlexer::sxlexer (char const *file, FILE *fh)
  : lexer (file, fh)
{
}

sxlexer::sxlexer (char const *file, std::string const &s)
  : lexer (file, s)
{
}

sxlexer::~sxlexer ()
{
}
