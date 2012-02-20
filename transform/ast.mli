open Sexplib

type location = {
  first_line : int;
  first_column : int;
  last_line : int;
  last_column : int;
  file : string;
}

type ast
  = Nothing
  | Token of location * int * string
  | InlineTypeQualifier of location * (*n1*) ast
  | TernaryOp of location * (*cond*) ast * (*qmark*) ast * (*then_expr*) ast * (*colon*) ast * (*else_expr*) ast
  | TypedefStrClassSpec of location * (*typedef*) ast
  | Equals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | FloatingConstant of location * (*token*) ast
  | DeclInitialiser of location * (*equals*) ast * (*init*) ast
  | LineDirective of location * (*hash*) ast * (*line*) ast * (*file*) ast * (*level*) ast
  | DeclarationQualifierList33 of location * (*dquals*) ast * (*dqual*) ast
  | TypeName of location * (*tspec*) ast * (*decl*) ast
  | Enumerator of location * (*id*) ast * (*value*) ast
  | BitwiseOr of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BitwiseXor of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SignerTypeSpec of location * (*signed*) ast
  | AddressOf of location * (*op*) ast * (*expr*) ast
  | TypedefDeclarationSpecifier28 of location * (*tspec*) ast * (*str_class*) ast
  | Attrib376 of location * (*name*) ast
  | StructDeclaration382 of location * (*n1*) ast * (*n2*) ast
  | SizeofVar of location * (*op*) ast * (*expr*) ast
  | AsmStatement of location * (*asm_tok*) ast * (*tquals*) ast * (*lbrack*) ast * (*code*) ast * (*in_arg_colon*) ast * (*in_args*) ast * (*out_arg_colon*) ast * (*out_args*) ast * (*clobber_colon*) ast * (*clobbers*) ast * (*rbrack*) ast * (*semi*) ast
  | ModuloAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BitwiseNegate of location * (*op*) ast * (*expr*) ast
  | LeftShiftAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Assign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Positive of location * (*op*) ast * (*expr*) ast
  | FunctionDefinitionTqual of location * (*tqual*) ast * (*declarator*) ast * (*body*) ast
  | RestrictTypeQualifier of location * (*n1*) ast
  | DefaultDeclaringList16 of location * (*prev*) ast * (*sep*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | BracketExpression of location * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | ArrayLabelledInitialised of location * (*lsqbrack*) ast * (*expr*) ast * (*dots*) ast * (*expr2*) ast * (*equals*) ast * (*rsqbrack*) ast * (*init*) ast
  | Divide of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SueDeclarationSpecifier27 of location * (*dspec*) ast * (*dqual*) ast
  | StructDeclaringList392 of location * (*n1*) ast * (*n2*) ast * (*n3*) ast * (*n4*) ast
  | TypeofTypeSpecifier of location * (*tquals*) ast * (*typeof_tok*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | IfStatement of location * (*if*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*then_stmt*) ast * (*else*) ast * (*else_stmt*) ast
  | NodeList of location * (*prev*) ast * (*sep*) ast * (*node*) ast
  | CompoundStatement of location * (*lbrace*) ast * (*stmts*) ast * (*rbrace*) ast
  | SueTypeSpecifier46 of location * (*tspec*) ast * (*tqual*) ast
  | AndAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LongTypeSpec of location * (*long*) ast
  | XorAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | StructDeclaration of location * (*declrs*) ast * (*semi*) ast
  | StructDefaultDeclaringList1 of location * (*squals*) ast * (*id*) ast
  | StructAccess of location * (*lhs*) ast * (*op*) ast * (*member*) ast
  | VolatileTypeQualifier of location * (*volatile*) ast
  | ArrayAbstractDeclarator of location * (*lsqbrack*) ast * (*expr*) ast * (*rsqbrack*) ast
  | NotEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ConstTypeQualifier of location * (*const*) ast
  | GreaterThan of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | DoStatement of location * (*do*) ast * (*stmt*) ast * (*while*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*semi*) ast
  | ExpressionStatement of location * (*expr*) ast * (*semi*) ast
  | Declarator384 of location * (*n1*) ast * (*n2*) ast
  | FloatTypeSpec of location * (*float*) ast
  | CharConstant of location * (*token*) ast
  | TypeofExpression388 of location * (*n1*) ast
  | MultiplyAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Identifier of location * (*token*) ast
  | Attributes370 of location * (*n1*) ast
  | ExternStrClassSpec of location * (*extern*) ast
  | FunctionDefinition of location * (*declarator*) ast * (*body*) ast
  | ParenPostfixTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*post_declr*) ast * (*post_declr2*) ast * (*rbrack*) ast
  | BasicTypeSpecifier41 of location * (*tquals*) ast * (*tname*) ast
  | BasicTypeSpecifier43 of location * (*tspec*) ast * (*tname*) ast
  | TypeSpecifierNosue387 of location * (*n1*) ast
  | CharTypeSpec of location * (*char*) ast
  | StructIdentifierDeclarator of location * (*decl*) ast * (*bitfield*) ast * (*attrs*) ast
  | Negate of location * (*op*) ast * (*expr*) ast
  | DefaultLabelStatement of location * (*default*) ast * (*semi*) ast
  | Attrib379 of location * (*name*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | BitFieldSize of location * (*colon*) ast * (*expr*) ast
  | BasicDeclarationSpecifier21 of location * (*tspec*) ast * (*str_class*) ast
  | TypedefDeclarationSpecifier30 of location * (*dspec*) ast * (*dqual*) ast
  | AsmClobbered of location * (*clobber*) ast
  | BitwiseAnd of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Statement350 of location * (*n1*) ast
  | GccExtension386 of location * (*n1*) ast
  | IncludeDirective of location * (*incl*) ast
  | Add of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | VaListTypeSpec of location * (*n1*) ast
  | Attrib375 of location * (*n1*) ast
  | Union_ of location * (*union_tok*) ast
  | AddAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BreakStatement of location * (*break*) ast * (*semi*) ast
  | DeclaringList10 of location * (*dspec*) ast * (*attrs*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | Modulo of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | EnumeratorValue of location * (*equals*) ast * (*expr*) ast
  | AlignofType of location * (*alignof_tok*) ast * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast
  | SimpleParenTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast
  | WcharTypeSpec of location * (*wchar*) ast
  | TypeCast of location * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast * (*expr*) ast
  | GotoStatement of location * (*goto*) ast * (*label*) ast * (*semi*) ast
  | NodeMerge of location * (*n1*) ast * (*n2*) ast
  | VaArgExpression of location * (*va_arg_op*) ast * (*lbrack*) ast * (*expr*) ast * (*comma*) ast * (*type*) ast * (*rbrack*) ast
  | ParameterDeclaration157 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast * (*decl*) ast
  | TypedefName of location * (*token*) ast
  | ParenTypedefDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast
  | TypedefTypeSpecifier47 of location * (*tquals*) ast * (*tname*) ast
  | SueDeclarationSpecifier25 of location * (*tspec*) ast * (*str_class*) ast
  | GreaterThanEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Asm361 of location * (*n1*) ast * (*n2*) ast * (*n3*) ast * (*n4*) ast
  | WcharConstant of location * (*token*) ast
  | PostfixIdentifierDeclarator of location * (*lbrack*) ast * (*declr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | LabelStatement of location * (*label*) ast * (*semi*) ast
  | Declaration4 of location * (*tspec*) ast * (*semi*) ast
  | ArrayAccess of location * (*lhs*) ast * (*lsqbrack*) ast * (*rhs*) ast * (*rsqbrack*) ast
  | BasicDeclarationSpecifier23 of location * (*dspec*) ast * (*dqual*) ast
  | OrAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | RealExpression of location * (*op*) ast * (*expr*) ast
  | DeclaringList9 of location * (*dspec*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | ParameterDeclaration of location * (*attrs*) ast * (*dspec*) ast * (*tspec*) ast * (*declr*) ast
  | Attribute of location * (*attribute_tok*) ast * (*lbrack1*) ast * (*lbrack2*) ast * (*attributes*) ast * (*rbrack1*) ast * (*rbrack2*) ast
  | Declaration1 of location * (*declrs*) ast * (*semi*) ast
  | StructDefaultDeclaringList2 of location * (*prev*) ast * (*sep*) ast * (*id*) ast
  | CleanPostfixTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | DeclaringList12 of location * (*tspec*) ast * (*attrs*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | BracketedInitialiserList of location * (*lbrack*) ast * (*list*) ast * (*comma*) ast * (*rbrack*) ast
  | ParameterDeclaration158 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast * (*decl*) ast
  | UnaryIdentifierDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*id*) ast
  | FunctionDefinitionDqual of location * (*dqual*) ast * (*declarator*) ast * (*body*) ast
  | RightShiftAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | StructDeclaringList327 of location * (*prev*) ast * (*sep*) ast * (*declr*) ast
  | ImagExpression of location * (*op*) ast * (*expr*) ast
  | LessThan of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ComplexTypeQualifier of location * (*n1*) ast
  | FunctionDeclaration of location * (*spec*) ast * (*attrs*) ast * (*id*) ast * (*body*) ast
  | ParameterTypedefDeclarator71 of location * (*tname*) ast * (*post_declr*) ast
  | UnaryExpression383 of location * (*n1*) ast * (*n2*) ast
  | TranslationUnit of location * (*defs*) ast
  | DoubleTypeSpec of location * (*double*) ast
  | PreIncrement of location * (*op*) ast * (*expr*) ast
  | AsmArgument of location * (*target*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | DeclaringList13 of location * (*prev*) ast * (*sep*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DesignatedInitialiser of location * (*dot*) ast * (*id*) ast * (*equals*) ast * (*init*) ast
  | IntTypeSpec of location * (*int*) ast
  | PointerAccess of location * (*lhs*) ast * (*op*) ast * (*member*) ast
  | UnsignedTypeSpec of location * (*unsigned*) ast
  | SwitchStatement of location * (*switch*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast * (*stmt*) ast
  | BasicDeclarationSpecifier22 of location * (*dquals*) ast * (*tname*) ast
  | PostIncrement of location * (*expr*) ast * (*op*) ast
  | BasicTypeSpecifier42 of location * (*tspec*) ast * (*tqual*) ast
  | PreDecrement of location * (*op*) ast * (*expr*) ast
  | EnumSpecifier of location * (*enum_tok*) ast * (*tag*) ast * (*lbrace*) ast * (*values*) ast * (*comma*) ast * (*rbrace*) ast
  | SubtractAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Initialiser121 of location * (*id*) ast * (*colon*) ast * (*init*) ast
  | PostfixingAbstractDeclarator90 of location * (*lbrack*) ast * (*params*) ast * (*rbrack*) ast
  | DivideAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | TypedefDeclarationSpecifier29 of location * (*dquals*) ast * (*tname*) ast
  | ForStatement of location * (*for*) ast * (*lbrack*) ast * (*init*) ast * (*init_semi*) ast * (*cond*) ast * (*cond_semi*) ast * (*inc*) ast * (*rbrack*) ast * (*stmt*) ast
  | Struct_ of location * (*struct_tok*) ast
  | Subtract of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LessThanEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SueDeclarationSpecifier26 of location * (*dquals*) ast * (*tname*) ast * (*attrs*) ast
  | Attrib377 of location * (*name*) ast * (*lbrack*) ast * (*id*) ast * (*rbrack*) ast
  | Attrib378 of location * (*name*) ast * (*lbrack*) ast * (*id*) ast * (*comma*) ast * (*expr*) ast * (*rbrack*) ast
  | CaseLabelStatement of location * (*case*) ast * (*expr*) ast * (*semi*) ast
  | Multiply of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ParameterDeclaration156 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast
  | CleanTypedefDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*tdeclr*) ast
  | ShiftRight of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SueTypeSpecifier44 of location * (*tquals*) ast * (*tname*) ast
  | ShiftLeft of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | StaticStrClassSpec of location * (*static*) ast
  | BasicDeclarationSpecifier24 of location * (*dspec*) ast * (*tname*) ast
  | StringLiteral of location * (*token*) ast
  | RestrictPointerTypeQualifier of location * (*n1*) ast
  | NodeOpt of location * (*node*) ast
  | ShortTypeSpec of location * (*short*) ast
  | AutoStrClassSpec of location * (*auto*) ast
  | SizeofType of location * (*op*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | FunctionCall of location * (*lhs*) ast * (*lbrack*) ast * (*args*) ast * (*rbrack*) ast
  | DefaultDeclaringList14 of location * (*dquals*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | PostfixAbstractDeclarator of location * (*lbrack*) ast * (*declr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | Pointer of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*declr*) ast
  | CompoundLiteral of location * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast * (*init_list*) ast
  | ParenIdentifierDeclarator of location * (*lbrack*) ast * (*id*) ast * (*rbrack*) ast
  | Attributes371 of location * (*n1*) ast * (*n2*) ast
  | DeclarationQualifierList31 of location * (*tquals*) ast * (*attrs*) ast * (*str_class*) ast * (*attrs2*) ast
  | PointerDereference of location * (*op*) ast * (*expr*) ast
  | WhileStatement of location * (*while*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*stmt*) ast
  | ReturnStatement of location * (*return*) ast * (*expr*) ast * (*semi*) ast
  | TypedefTypeSpecifier49 of location * (*tspec*) ast * (*tqual*) ast
  | TypeofExpression389 of location * (*n1*) ast
  | ParameterTypedefDeclarator70 of location * (*tname*) ast
  | StructOrUnionSpecifier of location * (*sudcl*) ast * (*id*) ast * (*lbrace*) ast * (*fields*) ast * (*rbrace*) ast
  | IntegerConstant of location * (*token*) ast
  | LogicalAnd of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | OctalConstant of location * (*token*) ast
  | StructDeclaringList325 of location * (*tspec*) ast * (*attrs*) ast * (*declr*) ast
  | StructDeclarator of location * (*decl*) ast * (*bitfield*) ast * (*attrs*) ast
  | ExternalDefinition385 of location * (*n1*) ast * (*n2*) ast
  | LogicalNot of location * (*op*) ast * (*expr*) ast
  | LogicalOr of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | RegisterStrClassSpec of location * (*register*) ast
  | AlignofVar of location * (*alignof_tok*) ast * (*expr*) ast
  | ParameterTypeList of location * (*decls*) ast * (*comma*) ast * (*ellipsis*) ast
  | TypeName151 of location * (*tquals*) ast * (*defint*) ast * (*decl*) ast
  | ContinueStatement of location * (*continue*) ast * (*semi*) ast
  | CommaExpression of location * (*exprs*) ast
  | HexConstant of location * (*token*) ast
  | PostDecrement of location * (*expr*) ast * (*op*) ast
  | DeclaringList11 of location * (*tspec*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | Declaration3 of location * (*dspec*) ast * (*semi*) ast
  | BraceExpression of location * (*lbrack*) ast * (*body*) ast * (*rbrack*) ast
  | DefaultDeclaringList15 of location * (*tquals*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | StructDeclarationList of location * (*decl*) ast
  | VoidTypeSpec of location * (*void*) ast
  ;;

val resume : (ast -> ast) -> ast -> ast
