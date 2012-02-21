open Sexplib
open Token

type location = {
  first_line : int;
  first_column : int;
  last_line : int;
  last_column : int;
  file : string;
}

type ast
  = Nothing
  | Token of location * token_kind * string
  | AstList of location * ast list
  | Add of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | AddAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | AddressOf of location * (*op*) ast * (*expr*) ast
  | AlignofType of location * (*alignof_tok*) ast * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast
  | AlignofVar of location * (*alignof_tok*) ast * (*expr*) ast
  | AndAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ArrayAbstractDeclarator of location * (*lsqbrack*) ast * (*expr*) ast * (*rsqbrack*) ast
  | ArrayAccess of location * (*lhs*) ast * (*lsqbrack*) ast * (*rhs*) ast * (*rsqbrack*) ast
  | ArrayLabelledInitialised of location * (*lsqbrack*) ast * (*expr*) ast * (*dots*) ast * (*expr2*) ast * (*equals*) ast * (*rsqbrack*) ast * (*init*) ast
  | Asm361 of location * (*n1*) ast * (*n2*) ast * (*n3*) ast * (*n4*) ast
  | AsmArgument of location * (*target*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | AsmClobbered of location * (*clobber*) ast
  | AsmStatement of location * (*asm_tok*) ast * (*tquals*) ast * (*lbrack*) ast * (*code*) ast * (*in_arg_colon*) ast * (*in_args*) ast * (*out_arg_colon*) ast * (*out_args*) ast * (*clobber_colon*) ast * (*clobbers*) ast * (*rbrack*) ast * (*semi*) ast
  | Assign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Attrib375 of location * (*n1*) ast
  | Attrib376 of location * (*name*) ast
  | Attrib377 of location * (*name*) ast * (*lbrack*) ast * (*id*) ast * (*rbrack*) ast
  | Attrib378 of location * (*name*) ast * (*lbrack*) ast * (*id*) ast * (*comma*) ast * (*expr*) ast * (*rbrack*) ast
  | Attrib379 of location * (*name*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | Attribute of location * (*attribute_tok*) ast * (*lbrack1*) ast * (*lbrack2*) ast * (*attributes*) ast * (*rbrack1*) ast * (*rbrack2*) ast
  | Attributes370 of location * (*n1*) ast
  | Attributes371 of location * (*n1*) ast * (*n2*) ast
  | AutoStrClassSpec of location * (*auto*) ast
  | BasicDeclarationSpecifier21 of location * (*tspec*) ast * (*str_class*) ast
  | BasicDeclarationSpecifier22 of location * (*dquals*) ast * (*tname*) ast
  | BasicDeclarationSpecifier23 of location * (*dspec*) ast * (*dqual*) ast
  | BasicDeclarationSpecifier24 of location * (*dspec*) ast * (*tname*) ast
  | BasicTypeSpecifier41 of location * (*tquals*) ast * (*tname*) ast
  | BasicTypeSpecifier42 of location * (*tspec*) ast * (*tqual*) ast
  | BasicTypeSpecifier43 of location * (*tspec*) ast * (*tname*) ast
  | BitFieldSize of location * (*colon*) ast * (*expr*) ast
  | BitwiseAnd of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BitwiseNegate of location * (*op*) ast * (*expr*) ast
  | BitwiseOr of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BitwiseXor of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | BraceExpression of location * (*lbrack*) ast * (*body*) ast * (*rbrack*) ast
  | BracketExpression of location * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | BracketedInitialiserList of location * (*lbrack*) ast * (*list*) ast * (*comma*) ast * (*rbrack*) ast
  | BreakStatement of location * (*break*) ast * (*semi*) ast
  | CaseLabelStatement of location * (*case*) ast * (*expr*) ast * (*semi*) ast
  | CharConstant of location * (*token*) ast
  | CharTypeSpec of location * (*char*) ast
  | CleanPostfixTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | CleanTypedefDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*tdeclr*) ast
  | CommaExpression of location * (*exprs*) ast
  | ComplexTypeQualifier of location * (*n1*) ast
  | CompoundLiteral of location * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast * (*init_list*) ast
  | CompoundStatement of location * (*lbrace*) ast * (*stmts*) ast * (*rbrace*) ast
  | ConstTypeQualifier of location * (*const*) ast
  | ContinueStatement of location * (*continue*) ast * (*semi*) ast
  | DeclInitialiser of location * (*equals*) ast * (*init*) ast
  | Declaration1 of location * (*declrs*) ast * (*semi*) ast
  | Declaration3 of location * (*dspec*) ast * (*semi*) ast
  | Declaration4 of location * (*tspec*) ast * (*semi*) ast
  | DeclarationQualifierList31 of location * (*tquals*) ast * (*attrs*) ast * (*str_class*) ast * (*attrs2*) ast
  | DeclarationQualifierList33 of location * (*dquals*) ast * (*dqual*) ast
  | Declarator384 of location * (*n1*) ast * (*n2*) ast
  | DeclaringList10 of location * (*dspec*) ast * (*attrs*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DeclaringList11 of location * (*tspec*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DeclaringList12 of location * (*tspec*) ast * (*attrs*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DeclaringList13 of location * (*prev*) ast * (*sep*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DeclaringList9 of location * (*dspec*) ast * (*declr*) ast * (*register*) ast * (*attrs2*) ast * (*init*) ast
  | DefaultDeclaringList14 of location * (*dquals*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | DefaultDeclaringList15 of location * (*tquals*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | DefaultDeclaringList16 of location * (*prev*) ast * (*sep*) ast * (*id*) ast * (*attrs*) ast * (*init*) ast
  | DefaultLabelStatement of location * (*default*) ast * (*semi*) ast
  | DesignatedInitialiser of location * (*dot*) ast * (*id*) ast * (*equals*) ast * (*init*) ast
  | Divide of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | DivideAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | DoStatement of location * (*do*) ast * (*stmt*) ast * (*while*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*semi*) ast
  | DoubleTypeSpec of location * (*double*) ast
  | EnumSpecifier of location * (*enum_tok*) ast * (*tag*) ast * (*lbrace*) ast * (*values*) ast * (*comma*) ast * (*rbrace*) ast
  | Enumerator of location * (*id*) ast * (*value*) ast
  | EnumeratorValue of location * (*equals*) ast * (*expr*) ast
  | Equals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ExpressionStatement of location * (*expr*) ast * (*semi*) ast
  | ExternStrClassSpec of location * (*extern*) ast
  | ExternalDefinition385 of location * (*n1*) ast * (*n2*) ast
  | FloatTypeSpec of location * (*float*) ast
  | FloatingConstant of location * (*token*) ast
  | ForStatement of location * (*for*) ast * (*lbrack*) ast * (*init*) ast * (*init_semi*) ast * (*cond*) ast * (*cond_semi*) ast * (*inc*) ast * (*rbrack*) ast * (*stmt*) ast
  | FunctionCall of location * (*lhs*) ast * (*lbrack*) ast * (*args*) ast * (*rbrack*) ast
  | FunctionDeclaration of location * (*spec*) ast * (*attrs*) ast * (*id*) ast * (*body*) ast
  | FunctionDefinition of location * (*declarator*) ast * (*body*) ast
  | FunctionDefinitionDqual of location * (*dqual*) ast * (*declarator*) ast * (*body*) ast
  | FunctionDefinitionTqual of location * (*tqual*) ast * (*declarator*) ast * (*body*) ast
  | GccExtension386 of location * (*n1*) ast
  | GotoStatement of location * (*goto*) ast * (*label*) ast * (*semi*) ast
  | GreaterThan of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | GreaterThanEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | HexConstant of location * (*token*) ast
  | Identifier of location * (*token*) ast
  | IfStatement of location * (*if*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*then_stmt*) ast * (*else*) ast * (*else_stmt*) ast
  | ImagExpression of location * (*op*) ast * (*expr*) ast
  | IncludeDirective of location * (*incl*) ast
  | Initialiser121 of location * (*id*) ast * (*colon*) ast * (*init*) ast
  | InlineTypeQualifier of location * (*n1*) ast
  | IntTypeSpec of location * (*int*) ast
  | IntegerConstant of location * (*token*) ast
  | LabelStatement of location * (*label*) ast * (*semi*) ast
  | LeftShiftAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LessThan of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LessThanEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LineDirective of location * (*hash*) ast * (*line*) ast * (*file*) ast * (*level*) ast
  | LogicalAnd of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LogicalNot of location * (*op*) ast * (*expr*) ast
  | LogicalOr of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | LongTypeSpec of location * (*long*) ast
  | Modulo of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ModuloAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Multiply of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | MultiplyAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | Negate of location * (*op*) ast * (*expr*) ast
  | NodeList of location * (*prev*) ast * (*sep*) ast * (*node*) ast
  | NodeMerge of location * (*n1*) ast * (*n2*) ast
  | NodeOpt of location * (*node*) ast
  | NotEquals of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | OctalConstant of location * (*token*) ast
  | OrAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ParameterDeclaration of location * (*attrs*) ast * (*dspec*) ast * (*tspec*) ast * (*declr*) ast
  | ParameterDeclaration156 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast
  | ParameterDeclaration157 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast * (*decl*) ast
  | ParameterDeclaration158 of location * (*attrs*) ast * (*quals*) ast * (*defint*) ast * (*decl*) ast
  | ParameterTypeList of location * (*decls*) ast * (*comma*) ast * (*ellipsis*) ast
  | ParameterTypedefDeclarator70 of location * (*tname*) ast
  | ParameterTypedefDeclarator71 of location * (*tname*) ast * (*post_declr*) ast
  | ParenIdentifierDeclarator of location * (*lbrack*) ast * (*id*) ast * (*rbrack*) ast
  | ParenPostfixTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*post_declr*) ast * (*post_declr2*) ast * (*rbrack*) ast
  | ParenTypedefDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast
  | Pointer of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*declr*) ast
  | PointerAccess of location * (*lhs*) ast * (*op*) ast * (*member*) ast
  | PointerDereference of location * (*op*) ast * (*expr*) ast
  | Positive of location * (*op*) ast * (*expr*) ast
  | PostDecrement of location * (*expr*) ast * (*op*) ast
  | PostIncrement of location * (*expr*) ast * (*op*) ast
  | PostfixAbstractDeclarator of location * (*lbrack*) ast * (*declr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | PostfixIdentifierDeclarator of location * (*lbrack*) ast * (*declr*) ast * (*rbrack*) ast * (*post_declr*) ast
  | PostfixingAbstractDeclarator90 of location * (*lbrack*) ast * (*params*) ast * (*rbrack*) ast
  | PreDecrement of location * (*op*) ast * (*expr*) ast
  | PreIncrement of location * (*op*) ast * (*expr*) ast
  | RealExpression of location * (*op*) ast * (*expr*) ast
  | RegisterStrClassSpec of location * (*register*) ast
  | RestrictPointerTypeQualifier of location * (*n1*) ast
  | RestrictTypeQualifier of location * (*n1*) ast
  | ReturnStatement of location * (*return*) ast * (*expr*) ast * (*semi*) ast
  | RightShiftAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ShiftLeft of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ShiftRight of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | ShortTypeSpec of location * (*short*) ast
  | SignerTypeSpec of location * (*signed*) ast
  | SimpleParenTypedefDeclarator of location * (*lbrack*) ast * (*tdeclr*) ast * (*rbrack*) ast
  | SizeofType of location * (*op*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | SizeofVar of location * (*op*) ast * (*expr*) ast
  | Statement350 of location * (*n1*) ast
  | StaticStrClassSpec of location * (*static*) ast
  | StringLiteral of location * (*token*) ast
  | Struct of location * (*struct_tok*) ast
  | StructAccess of location * (*lhs*) ast * (*op*) ast * (*member*) ast
  | StructDeclaration of location * (*declrs*) ast * (*semi*) ast
  | StructDeclaration382 of location * (*n1*) ast * (*n2*) ast
  | StructDeclarationList of location * (*decl*) ast
  | StructDeclarator of location * (*decl*) ast * (*bitfield*) ast * (*attrs*) ast
  | StructDeclaringList325 of location * (*tspec*) ast * (*attrs*) ast * (*declr*) ast
  | StructDeclaringList327 of location * (*prev*) ast * (*sep*) ast * (*declr*) ast
  | StructDeclaringList392 of location * (*n1*) ast * (*n2*) ast * (*n3*) ast * (*n4*) ast
  | StructDefaultDeclaringList1 of location * (*squals*) ast * (*id*) ast
  | StructDefaultDeclaringList2 of location * (*prev*) ast * (*sep*) ast * (*id*) ast
  | StructIdentifierDeclarator of location * (*decl*) ast * (*bitfield*) ast * (*attrs*) ast
  | StructOrUnionSpecifier of location * (*sudcl*) ast * (*id*) ast * (*lbrace*) ast * (*fields*) ast * (*rbrace*) ast
  | Subtract of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SubtractAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  | SueDeclarationSpecifier25 of location * (*tspec*) ast * (*str_class*) ast
  | SueDeclarationSpecifier26 of location * (*dquals*) ast * (*tname*) ast * (*attrs*) ast
  | SueDeclarationSpecifier27 of location * (*dspec*) ast * (*dqual*) ast
  | SueTypeSpecifier44 of location * (*tquals*) ast * (*tname*) ast
  | SueTypeSpecifier46 of location * (*tspec*) ast * (*tqual*) ast
  | SwitchStatement of location * (*switch*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast * (*stmt*) ast
  | TernaryOp of location * (*cond*) ast * (*qmark*) ast * (*then_expr*) ast * (*colon*) ast * (*else_expr*) ast
  | TranslationUnit of location * (*defs*) ast
  | TypeCast of location * (*lbrack*) ast * (*type*) ast * (*rbrack*) ast * (*expr*) ast
  | TypeName of location * (*tspec*) ast * (*decl*) ast
  | TypeName151 of location * (*tquals*) ast * (*defint*) ast * (*decl*) ast
  | TypeSpecifierNosue387 of location * (*n1*) ast
  | TypedefDeclarationSpecifier28 of location * (*tspec*) ast * (*str_class*) ast
  | TypedefDeclarationSpecifier29 of location * (*dquals*) ast * (*tname*) ast
  | TypedefDeclarationSpecifier30 of location * (*dspec*) ast * (*dqual*) ast
  | TypedefName of location * (*token*) ast
  | TypedefStrClassSpec of location * (*typedef*) ast
  | TypedefTypeSpecifier47 of location * (*tquals*) ast * (*tname*) ast
  | TypedefTypeSpecifier49 of location * (*tspec*) ast * (*tqual*) ast
  | TypeofExpression388 of location * (*n1*) ast
  | TypeofExpression389 of location * (*n1*) ast
  | TypeofTypeSpecifier of location * (*tquals*) ast * (*typeof_tok*) ast * (*lbrack*) ast * (*expr*) ast * (*rbrack*) ast
  | UnaryExpression383 of location * (*n1*) ast * (*n2*) ast
  | UnaryIdentifierDeclarator of location * (*star*) ast * (*attrs*) ast * (*tquals*) ast * (*id*) ast
  | Union of location * (*union_tok*) ast
  | UnsignedTypeSpec of location * (*unsigned*) ast
  | VaArgExpression of location * (*va_arg_op*) ast * (*lbrack*) ast * (*expr*) ast * (*comma*) ast * (*type*) ast * (*rbrack*) ast
  | VaListTypeSpec of location * (*n1*) ast
  | VoidTypeSpec of location * (*void*) ast
  | VolatileTypeQualifier of location * (*volatile*) ast
  | WcharConstant of location * (*token*) ast
  | WcharTypeSpec of location * (*wchar*) ast
  | WhileStatement of location * (*while*) ast * (*lbrack*) ast * (*cond*) ast * (*rbrack*) ast * (*stmt*) ast
  | XorAssign of location * (*lhs*) ast * (*op*) ast * (*rhs*) ast
  ;;

val resume : (ast -> ast) -> ast -> ast
