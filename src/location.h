#pragma once

struct location
{
  char const *file;
  int first_line;
  int first_column;
  int last_line;
  int last_column;

  static location const generated;
  static location const invalid;
};
