#include "shstrs.h"

shstr const *shstrs;

void
shstr::init_shstrs ()
{
  static shstr strs[REDUCE_THERE];

#define SHSTR(TOK, STR)	strs[TOK] = shstr (STR, sizeof STR - 1)
  SHSTR (KW_ALIGNOF, "alignof");
  SHSTR (KW_ASM, "asm");
  SHSTR (KW_ATTRIBUTE, "__attribute__");
  SHSTR (KW_AUTO, "auto");
  SHSTR (KW_BREAK, "break");
  SHSTR (KW_CASE, "case");
  SHSTR (KW_CHAR, "char");
  SHSTR (KW_COMPLEX, "complex");
  SHSTR (KW_CONST, "const");
  SHSTR (KW_CONTINUE, "continue");
  SHSTR (KW_DEFAULT, "default");
  SHSTR (KW_DO, "do");
  SHSTR (KW_DOUBLE, "double");
  SHSTR (KW_ELSE, "else");
  SHSTR (KW_ENUM, "enum");
  SHSTR (KW_EXTENSION, "__extension__");
  SHSTR (KW_EXTERN, "extern");
  SHSTR (KW_FLOAT, "float");
  SHSTR (KW_FOR, "for");
  SHSTR (KW_GOTO, "goto");
  SHSTR (KW_IF, "if");
  SHSTR (KW_IMAG, "imag");
  SHSTR (KW_INLINE, "inline");
  SHSTR (KW_INT, "int");
  SHSTR (KW_LONG, "long");
  SHSTR (KW_REAL, "real");
  SHSTR (KW_REGISTER, "register");
  SHSTR (KW_RESTRICT, "restrict");
  SHSTR (KW_RETURN, "return");
  SHSTR (KW_SHORT, "short");
  SHSTR (KW_SIGNED, "signed");
  SHSTR (KW_SIZEOF, "sizeof");
  SHSTR (KW_STATIC, "static");
  SHSTR (KW_STRUCT, "struct");
  SHSTR (KW_SWITCH, "switch");
  SHSTR (KW_TYPEDEF, "typedef");
  SHSTR (KW_TYPEOF, "typeof");
  SHSTR (KW_UNION, "union");
  SHSTR (KW_UNSIGNED, "unsigned");
  SHSTR (KW_VA_ARG, "va_arg");
  SHSTR (KW_VA_LIST, "va_list");
  SHSTR (KW_VOID, "void");
  SHSTR (KW_VOLATILE, "volatile");
  SHSTR (KW_WCHAR_T, "wchar_t");
  SHSTR (KW_WHILE, "while");
  SHSTR (TK_AND, "&");
  SHSTR (TK_ANDAND, "&&");
  SHSTR (TK_AND_EQ, "&=");
  SHSTR (TK_ARROW, "->");
  SHSTR (TK_CARET, "^");
  SHSTR (TK_CARET_EQ, "^=");
  SHSTR (TK_COLON, ":");
  SHSTR (TK_COMMA, ",");
  SHSTR (TK_DEC, "--");
  SHSTR (TK_ELLIPSIS, "...");
  SHSTR (TK_EQEQ, "==");
  SHSTR (TK_EQUALS, "=");
  SHSTR (TK_EXMARK, "!");
  SHSTR (TK_GREATER, ">");
  SHSTR (TK_GREATER_EQ, ">=");
  SHSTR (TK_GTGT, ">>");
  SHSTR (TK_GTGT_EQ, ">>=");
  SHSTR (TK_HASH, "#");
  SHSTR (TK_HASHHASH, "##");
  SHSTR (TK_INC, "++");
  SHSTR (TK_LBRACE, "{");
  SHSTR (TK_LBRACK, "(");
  SHSTR (TK_LESS, "<");
  SHSTR (TK_LESS_EQ, "<=");
  SHSTR (TK_LSQBRACK, "[");
  SHSTR (TK_LTLT, "<<");
  SHSTR (TK_LTLT_EQ, "<<=");
  SHSTR (TK_MINUS, "-");
  SHSTR (TK_MINUS_EQ, "-=");
  SHSTR (TK_NE, "!=");
  SHSTR (TK_PERCENT, "%");
  SHSTR (TK_PERCENT_EQ, "%=");
  SHSTR (TK_PERIOD, ".");
  SHSTR (TK_PIPE, "|");
  SHSTR (TK_PIPE_EQ, "|=");
  SHSTR (TK_PIPEPIPE, "||");
  SHSTR (TK_PLUS, "+");
  SHSTR (TK_PLUS_EQ, "+=");
  SHSTR (TK_QMARK, "?");
  SHSTR (TK_RBRACE, "}");
  SHSTR (TK_RBRACK, ")");
  SHSTR (TK_RSQBRACK, "]");
  SHSTR (TK_SEMICOLON, ";");
  SHSTR (TK_SLASH, "/");
  SHSTR (TK_SLASH_EQ, "/=");
  SHSTR (TK_STAR, "*");
  SHSTR (TK_STAR_EQ, "*=");
  SHSTR (TK_TILDE, "~");
#undef SHSTR

  shstrs = strs;
}
