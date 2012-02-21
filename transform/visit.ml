open Ast
open Location
open Sexplib
open Sexp
open Token

let resume fn expr =
  match expr with
  | Nothing -> expr
  | Token (_, _, _) -> expr
  | AstList (loc, l) -> AstList (loc, List.map fn l)
  | Add (loc, lhs_, op_, rhs_) -> Add (loc, fn lhs_, fn op_, fn rhs_)
  | AddAssign (loc, lhs_, op_, rhs_) -> AddAssign (loc, fn lhs_, fn op_, fn rhs_)
  | AddressOf (loc, op_, expr_) -> AddressOf (loc, fn op_, fn expr_)
  | AlignofType (loc, alignof_tok_, lbrack_, type_, rbrack_) -> AlignofType (loc, fn alignof_tok_, fn lbrack_, fn type_, fn rbrack_)
  | AlignofVar (loc, alignof_tok_, expr_) -> AlignofVar (loc, fn alignof_tok_, fn expr_)
  | AndAssign (loc, lhs_, op_, rhs_) -> AndAssign (loc, fn lhs_, fn op_, fn rhs_)
  | ArrayAbstractDeclarator (loc, lsqbrack_, expr_, rsqbrack_) -> ArrayAbstractDeclarator (loc, fn lsqbrack_, fn expr_, fn rsqbrack_)
  | ArrayAccess (loc, lhs_, lsqbrack_, rhs_, rsqbrack_) -> ArrayAccess (loc, fn lhs_, fn lsqbrack_, fn rhs_, fn rsqbrack_)
  | ArrayLabelledInitialised (loc, lsqbrack_, expr_, dots_, expr2_, equals_, rsqbrack_, init_) -> ArrayLabelledInitialised (loc, fn lsqbrack_, fn expr_, fn dots_, fn expr2_, fn equals_, fn rsqbrack_, fn init_)
  | Asm361 (loc, n1_, n2_, n3_, n4_) -> Asm361 (loc, fn n1_, fn n2_, fn n3_, fn n4_)
  | AsmArgument (loc, target_, lbrack_, expr_, rbrack_) -> AsmArgument (loc, fn target_, fn lbrack_, fn expr_, fn rbrack_)
  | AsmClobbered (loc, clobber_) -> AsmClobbered (loc, fn clobber_)
  | AsmStatement (loc, asm_tok_, tquals_, lbrack_, code_, in_arg_colon_, in_args_, out_arg_colon_, out_args_, clobber_colon_, clobbers_, rbrack_, semi_) -> AsmStatement (loc, fn asm_tok_, fn tquals_, fn lbrack_, fn code_, fn in_arg_colon_, fn in_args_, fn out_arg_colon_, fn out_args_, fn clobber_colon_, fn clobbers_, fn rbrack_, fn semi_)
  | Assign (loc, lhs_, op_, rhs_) -> Assign (loc, fn lhs_, fn op_, fn rhs_)
  | Attrib375 (loc, n1_) -> Attrib375 (loc, fn n1_)
  | Attrib376 (loc, name_) -> Attrib376 (loc, fn name_)
  | Attrib377 (loc, name_, lbrack_, id_, rbrack_) -> Attrib377 (loc, fn name_, fn lbrack_, fn id_, fn rbrack_)
  | Attrib378 (loc, name_, lbrack_, id_, comma_, expr_, rbrack_) -> Attrib378 (loc, fn name_, fn lbrack_, fn id_, fn comma_, fn expr_, fn rbrack_)
  | Attrib379 (loc, name_, lbrack_, expr_, rbrack_) -> Attrib379 (loc, fn name_, fn lbrack_, fn expr_, fn rbrack_)
  | Attribute (loc, attribute_tok_, lbrack1_, lbrack2_, attributes_, rbrack1_, rbrack2_) -> Attribute (loc, fn attribute_tok_, fn lbrack1_, fn lbrack2_, fn attributes_, fn rbrack1_, fn rbrack2_)
  | Attributes370 (loc, n1_) -> Attributes370 (loc, fn n1_)
  | Attributes371 (loc, n1_, n2_) -> Attributes371 (loc, fn n1_, fn n2_)
  | AutoStrClassSpec (loc, auto_) -> AutoStrClassSpec (loc, fn auto_)
  | BasicDeclarationSpecifier21 (loc, tspec_, str_class_) -> BasicDeclarationSpecifier21 (loc, fn tspec_, fn str_class_)
  | BasicDeclarationSpecifier22 (loc, dquals_, tname_) -> BasicDeclarationSpecifier22 (loc, fn dquals_, fn tname_)
  | BasicDeclarationSpecifier23 (loc, dspec_, dqual_) -> BasicDeclarationSpecifier23 (loc, fn dspec_, fn dqual_)
  | BasicDeclarationSpecifier24 (loc, dspec_, tname_) -> BasicDeclarationSpecifier24 (loc, fn dspec_, fn tname_)
  | BasicTypeSpecifier41 (loc, tquals_, tname_) -> BasicTypeSpecifier41 (loc, fn tquals_, fn tname_)
  | BasicTypeSpecifier42 (loc, tspec_, tqual_) -> BasicTypeSpecifier42 (loc, fn tspec_, fn tqual_)
  | BasicTypeSpecifier43 (loc, tspec_, tname_) -> BasicTypeSpecifier43 (loc, fn tspec_, fn tname_)
  | BitFieldSize (loc, colon_, expr_) -> BitFieldSize (loc, fn colon_, fn expr_)
  | BitwiseAnd (loc, lhs_, op_, rhs_) -> BitwiseAnd (loc, fn lhs_, fn op_, fn rhs_)
  | BitwiseNegate (loc, op_, expr_) -> BitwiseNegate (loc, fn op_, fn expr_)
  | BitwiseOr (loc, lhs_, op_, rhs_) -> BitwiseOr (loc, fn lhs_, fn op_, fn rhs_)
  | BitwiseXor (loc, lhs_, op_, rhs_) -> BitwiseXor (loc, fn lhs_, fn op_, fn rhs_)
  | BraceExpression (loc, lbrack_, body_, rbrack_) -> BraceExpression (loc, fn lbrack_, fn body_, fn rbrack_)
  | BracketExpression (loc, lbrack_, expr_, rbrack_) -> BracketExpression (loc, fn lbrack_, fn expr_, fn rbrack_)
  | BracketedInitialiserList (loc, lbrack_, list_, comma_, rbrack_) -> BracketedInitialiserList (loc, fn lbrack_, fn list_, fn comma_, fn rbrack_)
  | BreakStatement (loc, break_, semi_) -> BreakStatement (loc, fn break_, fn semi_)
  | CaseLabelStatement (loc, case_, expr_, semi_) -> CaseLabelStatement (loc, fn case_, fn expr_, fn semi_)
  | CharConstant (loc, token_) -> CharConstant (loc, fn token_)
  | CharTypeSpec (loc, char_) -> CharTypeSpec (loc, fn char_)
  | CleanPostfixTypedefDeclarator (loc, lbrack_, tdeclr_, rbrack_, post_declr_) -> CleanPostfixTypedefDeclarator (loc, fn lbrack_, fn tdeclr_, fn rbrack_, fn post_declr_)
  | CleanTypedefDeclarator (loc, star_, attrs_, tquals_, tdeclr_) -> CleanTypedefDeclarator (loc, fn star_, fn attrs_, fn tquals_, fn tdeclr_)
  | CommaExpression (loc, exprs_) -> CommaExpression (loc, fn exprs_)
  | ComplexTypeQualifier (loc, n1_) -> ComplexTypeQualifier (loc, fn n1_)
  | CompoundLiteral (loc, lbrack_, type_, rbrack_, init_list_) -> CompoundLiteral (loc, fn lbrack_, fn type_, fn rbrack_, fn init_list_)
  | CompoundStatement (loc, lbrace_, stmts_, rbrace_) -> CompoundStatement (loc, fn lbrace_, fn stmts_, fn rbrace_)
  | ConstTypeQualifier (loc, const_) -> ConstTypeQualifier (loc, fn const_)
  | ContinueStatement (loc, continue_, semi_) -> ContinueStatement (loc, fn continue_, fn semi_)
  | DeclInitialiser (loc, equals_, init_) -> DeclInitialiser (loc, fn equals_, fn init_)
  | Declaration1 (loc, declrs_, semi_) -> Declaration1 (loc, fn declrs_, fn semi_)
  | Declaration3 (loc, dspec_, semi_) -> Declaration3 (loc, fn dspec_, fn semi_)
  | Declaration4 (loc, tspec_, semi_) -> Declaration4 (loc, fn tspec_, fn semi_)
  | DeclarationQualifierList31 (loc, tquals_, attrs_, str_class_, attrs2_) -> DeclarationQualifierList31 (loc, fn tquals_, fn attrs_, fn str_class_, fn attrs2_)
  | DeclarationQualifierList33 (loc, dquals_, dqual_) -> DeclarationQualifierList33 (loc, fn dquals_, fn dqual_)
  | Declarator384 (loc, n1_, n2_) -> Declarator384 (loc, fn n1_, fn n2_)
  | DeclaringList10 (loc, dspec_, attrs_, declr_, register_, attrs2_, init_) -> DeclaringList10 (loc, fn dspec_, fn attrs_, fn declr_, fn register_, fn attrs2_, fn init_)
  | DeclaringList11 (loc, tspec_, declr_, register_, attrs2_, init_) -> DeclaringList11 (loc, fn tspec_, fn declr_, fn register_, fn attrs2_, fn init_)
  | DeclaringList12 (loc, tspec_, attrs_, declr_, register_, attrs2_, init_) -> DeclaringList12 (loc, fn tspec_, fn attrs_, fn declr_, fn register_, fn attrs2_, fn init_)
  | DeclaringList13 (loc, prev_, sep_, declr_, register_, attrs2_, init_) -> DeclaringList13 (loc, fn prev_, fn sep_, fn declr_, fn register_, fn attrs2_, fn init_)
  | DeclaringList9 (loc, dspec_, declr_, register_, attrs2_, init_) -> DeclaringList9 (loc, fn dspec_, fn declr_, fn register_, fn attrs2_, fn init_)
  | DefaultDeclaringList14 (loc, dquals_, id_, attrs_, init_) -> DefaultDeclaringList14 (loc, fn dquals_, fn id_, fn attrs_, fn init_)
  | DefaultDeclaringList15 (loc, tquals_, id_, attrs_, init_) -> DefaultDeclaringList15 (loc, fn tquals_, fn id_, fn attrs_, fn init_)
  | DefaultDeclaringList16 (loc, prev_, sep_, id_, attrs_, init_) -> DefaultDeclaringList16 (loc, fn prev_, fn sep_, fn id_, fn attrs_, fn init_)
  | DefaultLabelStatement (loc, default_, semi_) -> DefaultLabelStatement (loc, fn default_, fn semi_)
  | DesignatedInitialiser (loc, dot_, id_, equals_, init_) -> DesignatedInitialiser (loc, fn dot_, fn id_, fn equals_, fn init_)
  | Divide (loc, lhs_, op_, rhs_) -> Divide (loc, fn lhs_, fn op_, fn rhs_)
  | DivideAssign (loc, lhs_, op_, rhs_) -> DivideAssign (loc, fn lhs_, fn op_, fn rhs_)
  | DoStatement (loc, do_, stmt_, while_, lbrack_, cond_, rbrack_, semi_) -> DoStatement (loc, fn do_, fn stmt_, fn while_, fn lbrack_, fn cond_, fn rbrack_, fn semi_)
  | DoubleTypeSpec (loc, double_) -> DoubleTypeSpec (loc, fn double_)
  | EnumSpecifier (loc, enum_tok_, tag_, lbrace_, values_, comma_, rbrace_) -> EnumSpecifier (loc, fn enum_tok_, fn tag_, fn lbrace_, fn values_, fn comma_, fn rbrace_)
  | Enumerator (loc, id_, value_) -> Enumerator (loc, fn id_, fn value_)
  | EnumeratorValue (loc, equals_, expr_) -> EnumeratorValue (loc, fn equals_, fn expr_)
  | Equals (loc, lhs_, op_, rhs_) -> Equals (loc, fn lhs_, fn op_, fn rhs_)
  | ExpressionStatement (loc, expr_, semi_) -> ExpressionStatement (loc, fn expr_, fn semi_)
  | ExternStrClassSpec (loc, extern_) -> ExternStrClassSpec (loc, fn extern_)
  | ExternalDefinition385 (loc, n1_, n2_) -> ExternalDefinition385 (loc, fn n1_, fn n2_)
  | FloatTypeSpec (loc, float_) -> FloatTypeSpec (loc, fn float_)
  | FloatingConstant (loc, token_) -> FloatingConstant (loc, fn token_)
  | ForStatement (loc, for_, lbrack_, init_, init_semi_, cond_, cond_semi_, inc_, rbrack_, stmt_) -> ForStatement (loc, fn for_, fn lbrack_, fn init_, fn init_semi_, fn cond_, fn cond_semi_, fn inc_, fn rbrack_, fn stmt_)
  | FunctionCall (loc, lhs_, lbrack_, args_, rbrack_) -> FunctionCall (loc, fn lhs_, fn lbrack_, fn args_, fn rbrack_)
  | FunctionDeclaration (loc, spec_, attrs_, id_, body_) -> FunctionDeclaration (loc, fn spec_, fn attrs_, fn id_, fn body_)
  | FunctionDefinition (loc, declarator_, body_) -> FunctionDefinition (loc, fn declarator_, fn body_)
  | FunctionDefinitionDqual (loc, dqual_, declarator_, body_) -> FunctionDefinitionDqual (loc, fn dqual_, fn declarator_, fn body_)
  | FunctionDefinitionTqual (loc, tqual_, declarator_, body_) -> FunctionDefinitionTqual (loc, fn tqual_, fn declarator_, fn body_)
  | GccExtension386 (loc, n1_) -> GccExtension386 (loc, fn n1_)
  | GotoStatement (loc, goto_, label_, semi_) -> GotoStatement (loc, fn goto_, fn label_, fn semi_)
  | GreaterThan (loc, lhs_, op_, rhs_) -> GreaterThan (loc, fn lhs_, fn op_, fn rhs_)
  | GreaterThanEquals (loc, lhs_, op_, rhs_) -> GreaterThanEquals (loc, fn lhs_, fn op_, fn rhs_)
  | HexConstant (loc, token_) -> HexConstant (loc, fn token_)
  | Identifier (loc, token_) -> Identifier (loc, fn token_)
  | IfStatement (loc, if_, lbrack_, cond_, rbrack_, then_stmt_, else_, else_stmt_) -> IfStatement (loc, fn if_, fn lbrack_, fn cond_, fn rbrack_, fn then_stmt_, fn else_, fn else_stmt_)
  | ImagExpression (loc, op_, expr_) -> ImagExpression (loc, fn op_, fn expr_)
  | IncludeDirective (loc, incl_) -> IncludeDirective (loc, fn incl_)
  | Initialiser121 (loc, id_, colon_, init_) -> Initialiser121 (loc, fn id_, fn colon_, fn init_)
  | InlineTypeQualifier (loc, n1_) -> InlineTypeQualifier (loc, fn n1_)
  | IntTypeSpec (loc, int_) -> IntTypeSpec (loc, fn int_)
  | IntegerConstant (loc, token_) -> IntegerConstant (loc, fn token_)
  | LabelStatement (loc, label_, semi_) -> LabelStatement (loc, fn label_, fn semi_)
  | LeftShiftAssign (loc, lhs_, op_, rhs_) -> LeftShiftAssign (loc, fn lhs_, fn op_, fn rhs_)
  | LessThan (loc, lhs_, op_, rhs_) -> LessThan (loc, fn lhs_, fn op_, fn rhs_)
  | LessThanEquals (loc, lhs_, op_, rhs_) -> LessThanEquals (loc, fn lhs_, fn op_, fn rhs_)
  | LineDirective (loc, hash_, line_, file_, level_) -> LineDirective (loc, fn hash_, fn line_, fn file_, fn level_)
  | LogicalAnd (loc, lhs_, op_, rhs_) -> LogicalAnd (loc, fn lhs_, fn op_, fn rhs_)
  | LogicalNot (loc, op_, expr_) -> LogicalNot (loc, fn op_, fn expr_)
  | LogicalOr (loc, lhs_, op_, rhs_) -> LogicalOr (loc, fn lhs_, fn op_, fn rhs_)
  | LongTypeSpec (loc, long_) -> LongTypeSpec (loc, fn long_)
  | Modulo (loc, lhs_, op_, rhs_) -> Modulo (loc, fn lhs_, fn op_, fn rhs_)
  | ModuloAssign (loc, lhs_, op_, rhs_) -> ModuloAssign (loc, fn lhs_, fn op_, fn rhs_)
  | Multiply (loc, lhs_, op_, rhs_) -> Multiply (loc, fn lhs_, fn op_, fn rhs_)
  | MultiplyAssign (loc, lhs_, op_, rhs_) -> MultiplyAssign (loc, fn lhs_, fn op_, fn rhs_)
  | Negate (loc, op_, expr_) -> Negate (loc, fn op_, fn expr_)
  | NodeList (loc, prev_, sep_, node_) -> NodeList (loc, fn prev_, fn sep_, fn node_)
  | NodeMerge (loc, n1_, n2_) -> NodeMerge (loc, fn n1_, fn n2_)
  | NodeOpt (loc, node_) -> NodeOpt (loc, fn node_)
  | NotEquals (loc, lhs_, op_, rhs_) -> NotEquals (loc, fn lhs_, fn op_, fn rhs_)
  | OctalConstant (loc, token_) -> OctalConstant (loc, fn token_)
  | OrAssign (loc, lhs_, op_, rhs_) -> OrAssign (loc, fn lhs_, fn op_, fn rhs_)
  | ParameterDeclaration (loc, attrs_, dspec_, tspec_, declr_) -> ParameterDeclaration (loc, fn attrs_, fn dspec_, fn tspec_, fn declr_)
  | ParameterDeclaration156 (loc, attrs_, quals_, defint_) -> ParameterDeclaration156 (loc, fn attrs_, fn quals_, fn defint_)
  | ParameterDeclaration157 (loc, attrs_, quals_, defint_, decl_) -> ParameterDeclaration157 (loc, fn attrs_, fn quals_, fn defint_, fn decl_)
  | ParameterDeclaration158 (loc, attrs_, quals_, defint_, decl_) -> ParameterDeclaration158 (loc, fn attrs_, fn quals_, fn defint_, fn decl_)
  | ParameterTypeList (loc, decls_, comma_, ellipsis_) -> ParameterTypeList (loc, fn decls_, fn comma_, fn ellipsis_)
  | ParameterTypedefDeclarator70 (loc, tname_) -> ParameterTypedefDeclarator70 (loc, fn tname_)
  | ParameterTypedefDeclarator71 (loc, tname_, post_declr_) -> ParameterTypedefDeclarator71 (loc, fn tname_, fn post_declr_)
  | ParenIdentifierDeclarator (loc, lbrack_, id_, rbrack_) -> ParenIdentifierDeclarator (loc, fn lbrack_, fn id_, fn rbrack_)
  | ParenPostfixTypedefDeclarator (loc, lbrack_, tdeclr_, post_declr_, post_declr2_, rbrack_) -> ParenPostfixTypedefDeclarator (loc, fn lbrack_, fn tdeclr_, fn post_declr_, fn post_declr2_, fn rbrack_)
  | ParenTypedefDeclarator (loc, star_, attrs_, tquals_, lbrack_, tdeclr_, rbrack_) -> ParenTypedefDeclarator (loc, fn star_, fn attrs_, fn tquals_, fn lbrack_, fn tdeclr_, fn rbrack_)
  | Pointer (loc, star_, attrs_, tquals_, declr_) -> Pointer (loc, fn star_, fn attrs_, fn tquals_, fn declr_)
  | PointerAccess (loc, lhs_, op_, member_) -> PointerAccess (loc, fn lhs_, fn op_, fn member_)
  | PointerDereference (loc, op_, expr_) -> PointerDereference (loc, fn op_, fn expr_)
  | Positive (loc, op_, expr_) -> Positive (loc, fn op_, fn expr_)
  | PostDecrement (loc, expr_, op_) -> PostDecrement (loc, fn expr_, fn op_)
  | PostIncrement (loc, expr_, op_) -> PostIncrement (loc, fn expr_, fn op_)
  | PostfixAbstractDeclarator (loc, lbrack_, declr_, rbrack_, post_declr_) -> PostfixAbstractDeclarator (loc, fn lbrack_, fn declr_, fn rbrack_, fn post_declr_)
  | PostfixIdentifierDeclarator (loc, lbrack_, declr_, rbrack_, post_declr_) -> PostfixIdentifierDeclarator (loc, fn lbrack_, fn declr_, fn rbrack_, fn post_declr_)
  | PostfixingAbstractDeclarator90 (loc, lbrack_, params_, rbrack_) -> PostfixingAbstractDeclarator90 (loc, fn lbrack_, fn params_, fn rbrack_)
  | PreDecrement (loc, op_, expr_) -> PreDecrement (loc, fn op_, fn expr_)
  | PreIncrement (loc, op_, expr_) -> PreIncrement (loc, fn op_, fn expr_)
  | RealExpression (loc, op_, expr_) -> RealExpression (loc, fn op_, fn expr_)
  | RegisterStrClassSpec (loc, register_) -> RegisterStrClassSpec (loc, fn register_)
  | RestrictPointerTypeQualifier (loc, n1_) -> RestrictPointerTypeQualifier (loc, fn n1_)
  | RestrictTypeQualifier (loc, n1_) -> RestrictTypeQualifier (loc, fn n1_)
  | ReturnStatement (loc, return_, expr_, semi_) -> ReturnStatement (loc, fn return_, fn expr_, fn semi_)
  | RightShiftAssign (loc, lhs_, op_, rhs_) -> RightShiftAssign (loc, fn lhs_, fn op_, fn rhs_)
  | ShiftLeft (loc, lhs_, op_, rhs_) -> ShiftLeft (loc, fn lhs_, fn op_, fn rhs_)
  | ShiftRight (loc, lhs_, op_, rhs_) -> ShiftRight (loc, fn lhs_, fn op_, fn rhs_)
  | ShortTypeSpec (loc, short_) -> ShortTypeSpec (loc, fn short_)
  | SignerTypeSpec (loc, signed_) -> SignerTypeSpec (loc, fn signed_)
  | SimpleParenTypedefDeclarator (loc, lbrack_, tdeclr_, rbrack_) -> SimpleParenTypedefDeclarator (loc, fn lbrack_, fn tdeclr_, fn rbrack_)
  | SizeofType (loc, op_, lbrack_, expr_, rbrack_) -> SizeofType (loc, fn op_, fn lbrack_, fn expr_, fn rbrack_)
  | SizeofVar (loc, op_, expr_) -> SizeofVar (loc, fn op_, fn expr_)
  | Statement350 (loc, n1_) -> Statement350 (loc, fn n1_)
  | StaticStrClassSpec (loc, static_) -> StaticStrClassSpec (loc, fn static_)
  | StringLiteral (loc, token_) -> StringLiteral (loc, fn token_)
  | Struct (loc, struct_tok_) -> Struct (loc, fn struct_tok_)
  | StructAccess (loc, lhs_, op_, member_) -> StructAccess (loc, fn lhs_, fn op_, fn member_)
  | StructDeclaration (loc, declrs_, semi_) -> StructDeclaration (loc, fn declrs_, fn semi_)
  | StructDeclaration382 (loc, n1_, n2_) -> StructDeclaration382 (loc, fn n1_, fn n2_)
  | StructDeclarationList (loc, decl_) -> StructDeclarationList (loc, fn decl_)
  | StructDeclarator (loc, decl_, bitfield_, attrs_) -> StructDeclarator (loc, fn decl_, fn bitfield_, fn attrs_)
  | StructDeclaringList325 (loc, tspec_, attrs_, declr_) -> StructDeclaringList325 (loc, fn tspec_, fn attrs_, fn declr_)
  | StructDeclaringList327 (loc, prev_, sep_, declr_) -> StructDeclaringList327 (loc, fn prev_, fn sep_, fn declr_)
  | StructDeclaringList392 (loc, n1_, n2_, n3_, n4_) -> StructDeclaringList392 (loc, fn n1_, fn n2_, fn n3_, fn n4_)
  | StructDefaultDeclaringList1 (loc, squals_, id_) -> StructDefaultDeclaringList1 (loc, fn squals_, fn id_)
  | StructDefaultDeclaringList2 (loc, prev_, sep_, id_) -> StructDefaultDeclaringList2 (loc, fn prev_, fn sep_, fn id_)
  | StructIdentifierDeclarator (loc, decl_, bitfield_, attrs_) -> StructIdentifierDeclarator (loc, fn decl_, fn bitfield_, fn attrs_)
  | StructOrUnionSpecifier (loc, sudcl_, id_, lbrace_, fields_, rbrace_) -> StructOrUnionSpecifier (loc, fn sudcl_, fn id_, fn lbrace_, fn fields_, fn rbrace_)
  | Subtract (loc, lhs_, op_, rhs_) -> Subtract (loc, fn lhs_, fn op_, fn rhs_)
  | SubtractAssign (loc, lhs_, op_, rhs_) -> SubtractAssign (loc, fn lhs_, fn op_, fn rhs_)
  | SueDeclarationSpecifier25 (loc, tspec_, str_class_) -> SueDeclarationSpecifier25 (loc, fn tspec_, fn str_class_)
  | SueDeclarationSpecifier26 (loc, dquals_, tname_, attrs_) -> SueDeclarationSpecifier26 (loc, fn dquals_, fn tname_, fn attrs_)
  | SueDeclarationSpecifier27 (loc, dspec_, dqual_) -> SueDeclarationSpecifier27 (loc, fn dspec_, fn dqual_)
  | SueTypeSpecifier44 (loc, tquals_, tname_) -> SueTypeSpecifier44 (loc, fn tquals_, fn tname_)
  | SueTypeSpecifier46 (loc, tspec_, tqual_) -> SueTypeSpecifier46 (loc, fn tspec_, fn tqual_)
  | SwitchStatement (loc, switch_, lbrack_, expr_, rbrack_, stmt_) -> SwitchStatement (loc, fn switch_, fn lbrack_, fn expr_, fn rbrack_, fn stmt_)
  | TernaryOp (loc, cond_, qmark_, then_expr_, colon_, else_expr_) -> TernaryOp (loc, fn cond_, fn qmark_, fn then_expr_, fn colon_, fn else_expr_)
  | TranslationUnit (loc, defs_) -> TranslationUnit (loc, fn defs_)
  | TypeCast (loc, lbrack_, type_, rbrack_, expr_) -> TypeCast (loc, fn lbrack_, fn type_, fn rbrack_, fn expr_)
  | TypeName (loc, tspec_, decl_) -> TypeName (loc, fn tspec_, fn decl_)
  | TypeName151 (loc, tquals_, defint_, decl_) -> TypeName151 (loc, fn tquals_, fn defint_, fn decl_)
  | TypeSpecifierNosue387 (loc, n1_) -> TypeSpecifierNosue387 (loc, fn n1_)
  | TypedefDeclarationSpecifier28 (loc, tspec_, str_class_) -> TypedefDeclarationSpecifier28 (loc, fn tspec_, fn str_class_)
  | TypedefDeclarationSpecifier29 (loc, dquals_, tname_) -> TypedefDeclarationSpecifier29 (loc, fn dquals_, fn tname_)
  | TypedefDeclarationSpecifier30 (loc, dspec_, dqual_) -> TypedefDeclarationSpecifier30 (loc, fn dspec_, fn dqual_)
  | TypedefName (loc, token_) -> TypedefName (loc, fn token_)
  | TypedefStrClassSpec (loc, typedef_) -> TypedefStrClassSpec (loc, fn typedef_)
  | TypedefTypeSpecifier47 (loc, tquals_, tname_) -> TypedefTypeSpecifier47 (loc, fn tquals_, fn tname_)
  | TypedefTypeSpecifier49 (loc, tspec_, tqual_) -> TypedefTypeSpecifier49 (loc, fn tspec_, fn tqual_)
  | TypeofExpression388 (loc, n1_) -> TypeofExpression388 (loc, fn n1_)
  | TypeofExpression389 (loc, n1_) -> TypeofExpression389 (loc, fn n1_)
  | TypeofTypeSpecifier (loc, tquals_, typeof_tok_, lbrack_, expr_, rbrack_) -> TypeofTypeSpecifier (loc, fn tquals_, fn typeof_tok_, fn lbrack_, fn expr_, fn rbrack_)
  | UnaryExpression383 (loc, n1_, n2_) -> UnaryExpression383 (loc, fn n1_, fn n2_)
  | UnaryIdentifierDeclarator (loc, star_, attrs_, tquals_, id_) -> UnaryIdentifierDeclarator (loc, fn star_, fn attrs_, fn tquals_, fn id_)
  | Union (loc, union_tok_) -> Union (loc, fn union_tok_)
  | UnsignedTypeSpec (loc, unsigned_) -> UnsignedTypeSpec (loc, fn unsigned_)
  | VaArgExpression (loc, va_arg_op_, lbrack_, expr_, comma_, type_, rbrack_) -> VaArgExpression (loc, fn va_arg_op_, fn lbrack_, fn expr_, fn comma_, fn type_, fn rbrack_)
  | VaListTypeSpec (loc, n1_) -> VaListTypeSpec (loc, fn n1_)
  | VoidTypeSpec (loc, void_) -> VoidTypeSpec (loc, fn void_)
  | VolatileTypeQualifier (loc, volatile_) -> VolatileTypeQualifier (loc, fn volatile_)
  | WcharConstant (loc, token_) -> WcharConstant (loc, fn token_)
  | WcharTypeSpec (loc, wchar_) -> WcharTypeSpec (loc, fn wchar_)
  | WhileStatement (loc, while_, lbrack_, cond_, rbrack_, stmt_) -> WhileStatement (loc, fn while_, fn lbrack_, fn cond_, fn rbrack_, fn stmt_)
  | XorAssign (loc, lhs_, op_, rhs_) -> XorAssign (loc, fn lhs_, fn op_, fn rhs_)
  ;;

let rec ast_of_sexp x =
  match x with
  | Atom ("NIL") -> Nothing
  | List [Atom ("token"); loc; Atom (kind); Atom (lexeme)] ->
      Token (location_of_sexp loc, token_kind_of_string kind, lexeme)
  | List (Atom ("ast_list") :: (loc :: l)) ->
      AstList (location_of_sexp loc, List.map ast_of_sexp l)
  | List [Atom ("add"); loc; lhs_; op_; rhs_] ->
      Add (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("add_assign"); loc; lhs_; op_; rhs_] ->
      AddAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("address_of"); loc; op_; expr_] ->
      AddressOf (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("alignof_type"); loc; alignof_tok_; lbrack_; type_; rbrack_] ->
      AlignofType (location_of_sexp loc, ast_of_sexp alignof_tok_, ast_of_sexp lbrack_, ast_of_sexp type_, ast_of_sexp rbrack_)
  | List [Atom ("alignof_var"); loc; alignof_tok_; expr_] ->
      AlignofVar (location_of_sexp loc, ast_of_sexp alignof_tok_, ast_of_sexp expr_)
  | List [Atom ("and_assign"); loc; lhs_; op_; rhs_] ->
      AndAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("array_abstract_declarator"); loc; lsqbrack_; expr_; rsqbrack_] ->
      ArrayAbstractDeclarator (location_of_sexp loc, ast_of_sexp lsqbrack_, ast_of_sexp expr_, ast_of_sexp rsqbrack_)
  | List [Atom ("array_access"); loc; lhs_; lsqbrack_; rhs_; rsqbrack_] ->
      ArrayAccess (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp lsqbrack_, ast_of_sexp rhs_, ast_of_sexp rsqbrack_)
  | List [Atom ("array_labelled_initialised"); loc; lsqbrack_; expr_; dots_; expr2_; equals_; rsqbrack_; init_] ->
      ArrayLabelledInitialised (location_of_sexp loc, ast_of_sexp lsqbrack_, ast_of_sexp expr_, ast_of_sexp dots_, ast_of_sexp expr2_, ast_of_sexp equals_, ast_of_sexp rsqbrack_, ast_of_sexp init_)
  | List [Atom ("asm361"); loc; n1_; n2_; n3_; n4_] ->
      Asm361 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_, ast_of_sexp n3_, ast_of_sexp n4_)
  | List [Atom ("asm_argument"); loc; target_; lbrack_; expr_; rbrack_] ->
      AsmArgument (location_of_sexp loc, ast_of_sexp target_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("asm_clobbered"); loc; clobber_] ->
      AsmClobbered (location_of_sexp loc, ast_of_sexp clobber_)
  | List [Atom ("asm_statement"); loc; asm_tok_; tquals_; lbrack_; code_; in_arg_colon_; in_args_; out_arg_colon_; out_args_; clobber_colon_; clobbers_; rbrack_; semi_] ->
      AsmStatement (location_of_sexp loc, ast_of_sexp asm_tok_, ast_of_sexp tquals_, ast_of_sexp lbrack_, ast_of_sexp code_, ast_of_sexp in_arg_colon_, ast_of_sexp in_args_, ast_of_sexp out_arg_colon_, ast_of_sexp out_args_, ast_of_sexp clobber_colon_, ast_of_sexp clobbers_, ast_of_sexp rbrack_, ast_of_sexp semi_)
  | List [Atom ("assign"); loc; lhs_; op_; rhs_] ->
      Assign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("attrib375"); loc; n1_] ->
      Attrib375 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("attrib376"); loc; name_] ->
      Attrib376 (location_of_sexp loc, ast_of_sexp name_)
  | List [Atom ("attrib377"); loc; name_; lbrack_; id_; rbrack_] ->
      Attrib377 (location_of_sexp loc, ast_of_sexp name_, ast_of_sexp lbrack_, ast_of_sexp id_, ast_of_sexp rbrack_)
  | List [Atom ("attrib378"); loc; name_; lbrack_; id_; comma_; expr_; rbrack_] ->
      Attrib378 (location_of_sexp loc, ast_of_sexp name_, ast_of_sexp lbrack_, ast_of_sexp id_, ast_of_sexp comma_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("attrib379"); loc; name_; lbrack_; expr_; rbrack_] ->
      Attrib379 (location_of_sexp loc, ast_of_sexp name_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("attribute"); loc; attribute_tok_; lbrack1_; lbrack2_; attributes_; rbrack1_; rbrack2_] ->
      Attribute (location_of_sexp loc, ast_of_sexp attribute_tok_, ast_of_sexp lbrack1_, ast_of_sexp lbrack2_, ast_of_sexp attributes_, ast_of_sexp rbrack1_, ast_of_sexp rbrack2_)
  | List [Atom ("attributes370"); loc; n1_] ->
      Attributes370 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("attributes371"); loc; n1_; n2_] ->
      Attributes371 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("auto_str_class_spec"); loc; auto_] ->
      AutoStrClassSpec (location_of_sexp loc, ast_of_sexp auto_)
  | List [Atom ("basic_declaration_specifier21"); loc; tspec_; str_class_] ->
      BasicDeclarationSpecifier21 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp str_class_)
  | List [Atom ("basic_declaration_specifier22"); loc; dquals_; tname_] ->
      BasicDeclarationSpecifier22 (location_of_sexp loc, ast_of_sexp dquals_, ast_of_sexp tname_)
  | List [Atom ("basic_declaration_specifier23"); loc; dspec_; dqual_] ->
      BasicDeclarationSpecifier23 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp dqual_)
  | List [Atom ("basic_declaration_specifier24"); loc; dspec_; tname_] ->
      BasicDeclarationSpecifier24 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp tname_)
  | List [Atom ("basic_type_specifier41"); loc; tquals_; tname_] ->
      BasicTypeSpecifier41 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp tname_)
  | List [Atom ("basic_type_specifier42"); loc; tspec_; tqual_] ->
      BasicTypeSpecifier42 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp tqual_)
  | List [Atom ("basic_type_specifier43"); loc; tspec_; tname_] ->
      BasicTypeSpecifier43 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp tname_)
  | List [Atom ("bit_field_size"); loc; colon_; expr_] ->
      BitFieldSize (location_of_sexp loc, ast_of_sexp colon_, ast_of_sexp expr_)
  | List [Atom ("bitwise_and"); loc; lhs_; op_; rhs_] ->
      BitwiseAnd (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("bitwise_negate"); loc; op_; expr_] ->
      BitwiseNegate (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("bitwise_or"); loc; lhs_; op_; rhs_] ->
      BitwiseOr (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("bitwise_xor"); loc; lhs_; op_; rhs_] ->
      BitwiseXor (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("brace_expression"); loc; lbrack_; body_; rbrack_] ->
      BraceExpression (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp body_, ast_of_sexp rbrack_)
  | List [Atom ("bracket_expression"); loc; lbrack_; expr_; rbrack_] ->
      BracketExpression (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("bracketed_initialiser_list"); loc; lbrack_; list_; comma_; rbrack_] ->
      BracketedInitialiserList (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp list_, ast_of_sexp comma_, ast_of_sexp rbrack_)
  | List [Atom ("break_statement"); loc; break_; semi_] ->
      BreakStatement (location_of_sexp loc, ast_of_sexp break_, ast_of_sexp semi_)
  | List [Atom ("case_label_statement"); loc; case_; expr_; semi_] ->
      CaseLabelStatement (location_of_sexp loc, ast_of_sexp case_, ast_of_sexp expr_, ast_of_sexp semi_)
  | List [Atom ("char_constant"); loc; token_] ->
      CharConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("char_type_spec"); loc; char_] ->
      CharTypeSpec (location_of_sexp loc, ast_of_sexp char_)
  | List [Atom ("clean_postfix_typedef_declarator"); loc; lbrack_; tdeclr_; rbrack_; post_declr_] ->
      CleanPostfixTypedefDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp tdeclr_, ast_of_sexp rbrack_, ast_of_sexp post_declr_)
  | List [Atom ("clean_typedef_declarator"); loc; star_; attrs_; tquals_; tdeclr_] ->
      CleanTypedefDeclarator (location_of_sexp loc, ast_of_sexp star_, ast_of_sexp attrs_, ast_of_sexp tquals_, ast_of_sexp tdeclr_)
  | List [Atom ("comma_expression"); loc; exprs_] ->
      CommaExpression (location_of_sexp loc, ast_of_sexp exprs_)
  | List [Atom ("complex_type_qualifier"); loc; n1_] ->
      ComplexTypeQualifier (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("compound_literal"); loc; lbrack_; type_; rbrack_; init_list_] ->
      CompoundLiteral (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp type_, ast_of_sexp rbrack_, ast_of_sexp init_list_)
  | List [Atom ("compound_statement"); loc; lbrace_; stmts_; rbrace_] ->
      CompoundStatement (location_of_sexp loc, ast_of_sexp lbrace_, ast_of_sexp stmts_, ast_of_sexp rbrace_)
  | List [Atom ("const_type_qualifier"); loc; const_] ->
      ConstTypeQualifier (location_of_sexp loc, ast_of_sexp const_)
  | List [Atom ("continue_statement"); loc; continue_; semi_] ->
      ContinueStatement (location_of_sexp loc, ast_of_sexp continue_, ast_of_sexp semi_)
  | List [Atom ("decl_initialiser"); loc; equals_; init_] ->
      DeclInitialiser (location_of_sexp loc, ast_of_sexp equals_, ast_of_sexp init_)
  | List [Atom ("declaration1"); loc; declrs_; semi_] ->
      Declaration1 (location_of_sexp loc, ast_of_sexp declrs_, ast_of_sexp semi_)
  | List [Atom ("declaration3"); loc; dspec_; semi_] ->
      Declaration3 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp semi_)
  | List [Atom ("declaration4"); loc; tspec_; semi_] ->
      Declaration4 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp semi_)
  | List [Atom ("declaration_qualifier_list31"); loc; tquals_; attrs_; str_class_; attrs2_] ->
      DeclarationQualifierList31 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp attrs_, ast_of_sexp str_class_, ast_of_sexp attrs2_)
  | List [Atom ("declaration_qualifier_list33"); loc; dquals_; dqual_] ->
      DeclarationQualifierList33 (location_of_sexp loc, ast_of_sexp dquals_, ast_of_sexp dqual_)
  | List [Atom ("declarator384"); loc; n1_; n2_] ->
      Declarator384 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("declaring_list10"); loc; dspec_; attrs_; declr_; register_; attrs2_; init_] ->
      DeclaringList10 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp attrs_, ast_of_sexp declr_, ast_of_sexp register_, ast_of_sexp attrs2_, ast_of_sexp init_)
  | List [Atom ("declaring_list11"); loc; tspec_; declr_; register_; attrs2_; init_] ->
      DeclaringList11 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp declr_, ast_of_sexp register_, ast_of_sexp attrs2_, ast_of_sexp init_)
  | List [Atom ("declaring_list12"); loc; tspec_; attrs_; declr_; register_; attrs2_; init_] ->
      DeclaringList12 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp attrs_, ast_of_sexp declr_, ast_of_sexp register_, ast_of_sexp attrs2_, ast_of_sexp init_)
  | List [Atom ("declaring_list13"); loc; prev_; sep_; declr_; register_; attrs2_; init_] ->
      DeclaringList13 (location_of_sexp loc, ast_of_sexp prev_, ast_of_sexp sep_, ast_of_sexp declr_, ast_of_sexp register_, ast_of_sexp attrs2_, ast_of_sexp init_)
  | List [Atom ("declaring_list9"); loc; dspec_; declr_; register_; attrs2_; init_] ->
      DeclaringList9 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp declr_, ast_of_sexp register_, ast_of_sexp attrs2_, ast_of_sexp init_)
  | List [Atom ("default_declaring_list14"); loc; dquals_; id_; attrs_; init_] ->
      DefaultDeclaringList14 (location_of_sexp loc, ast_of_sexp dquals_, ast_of_sexp id_, ast_of_sexp attrs_, ast_of_sexp init_)
  | List [Atom ("default_declaring_list15"); loc; tquals_; id_; attrs_; init_] ->
      DefaultDeclaringList15 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp id_, ast_of_sexp attrs_, ast_of_sexp init_)
  | List [Atom ("default_declaring_list16"); loc; prev_; sep_; id_; attrs_; init_] ->
      DefaultDeclaringList16 (location_of_sexp loc, ast_of_sexp prev_, ast_of_sexp sep_, ast_of_sexp id_, ast_of_sexp attrs_, ast_of_sexp init_)
  | List [Atom ("default_label_statement"); loc; default_; semi_] ->
      DefaultLabelStatement (location_of_sexp loc, ast_of_sexp default_, ast_of_sexp semi_)
  | List [Atom ("designated_initialiser"); loc; dot_; id_; equals_; init_] ->
      DesignatedInitialiser (location_of_sexp loc, ast_of_sexp dot_, ast_of_sexp id_, ast_of_sexp equals_, ast_of_sexp init_)
  | List [Atom ("divide"); loc; lhs_; op_; rhs_] ->
      Divide (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("divide_assign"); loc; lhs_; op_; rhs_] ->
      DivideAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("do_statement"); loc; do_; stmt_; while_; lbrack_; cond_; rbrack_; semi_] ->
      DoStatement (location_of_sexp loc, ast_of_sexp do_, ast_of_sexp stmt_, ast_of_sexp while_, ast_of_sexp lbrack_, ast_of_sexp cond_, ast_of_sexp rbrack_, ast_of_sexp semi_)
  | List [Atom ("double_type_spec"); loc; double_] ->
      DoubleTypeSpec (location_of_sexp loc, ast_of_sexp double_)
  | List [Atom ("enum_specifier"); loc; enum_tok_; tag_; lbrace_; values_; comma_; rbrace_] ->
      EnumSpecifier (location_of_sexp loc, ast_of_sexp enum_tok_, ast_of_sexp tag_, ast_of_sexp lbrace_, ast_of_sexp values_, ast_of_sexp comma_, ast_of_sexp rbrace_)
  | List [Atom ("enumerator"); loc; id_; value_] ->
      Enumerator (location_of_sexp loc, ast_of_sexp id_, ast_of_sexp value_)
  | List [Atom ("enumerator_value"); loc; equals_; expr_] ->
      EnumeratorValue (location_of_sexp loc, ast_of_sexp equals_, ast_of_sexp expr_)
  | List [Atom ("equals"); loc; lhs_; op_; rhs_] ->
      Equals (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("expression_statement"); loc; expr_; semi_] ->
      ExpressionStatement (location_of_sexp loc, ast_of_sexp expr_, ast_of_sexp semi_)
  | List [Atom ("extern_str_class_spec"); loc; extern_] ->
      ExternStrClassSpec (location_of_sexp loc, ast_of_sexp extern_)
  | List [Atom ("external_definition385"); loc; n1_; n2_] ->
      ExternalDefinition385 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("float_type_spec"); loc; float_] ->
      FloatTypeSpec (location_of_sexp loc, ast_of_sexp float_)
  | List [Atom ("floating_constant"); loc; token_] ->
      FloatingConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("for_statement"); loc; for_; lbrack_; init_; init_semi_; cond_; cond_semi_; inc_; rbrack_; stmt_] ->
      ForStatement (location_of_sexp loc, ast_of_sexp for_, ast_of_sexp lbrack_, ast_of_sexp init_, ast_of_sexp init_semi_, ast_of_sexp cond_, ast_of_sexp cond_semi_, ast_of_sexp inc_, ast_of_sexp rbrack_, ast_of_sexp stmt_)
  | List [Atom ("function_call"); loc; lhs_; lbrack_; args_; rbrack_] ->
      FunctionCall (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp lbrack_, ast_of_sexp args_, ast_of_sexp rbrack_)
  | List [Atom ("function_declaration"); loc; spec_; attrs_; id_; body_] ->
      FunctionDeclaration (location_of_sexp loc, ast_of_sexp spec_, ast_of_sexp attrs_, ast_of_sexp id_, ast_of_sexp body_)
  | List [Atom ("function_definition"); loc; declarator_; body_] ->
      FunctionDefinition (location_of_sexp loc, ast_of_sexp declarator_, ast_of_sexp body_)
  | List [Atom ("function_definition_dqual"); loc; dqual_; declarator_; body_] ->
      FunctionDefinitionDqual (location_of_sexp loc, ast_of_sexp dqual_, ast_of_sexp declarator_, ast_of_sexp body_)
  | List [Atom ("function_definition_tqual"); loc; tqual_; declarator_; body_] ->
      FunctionDefinitionTqual (location_of_sexp loc, ast_of_sexp tqual_, ast_of_sexp declarator_, ast_of_sexp body_)
  | List [Atom ("gcc_extension386"); loc; n1_] ->
      GccExtension386 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("goto_statement"); loc; goto_; label_; semi_] ->
      GotoStatement (location_of_sexp loc, ast_of_sexp goto_, ast_of_sexp label_, ast_of_sexp semi_)
  | List [Atom ("greater_than"); loc; lhs_; op_; rhs_] ->
      GreaterThan (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("greater_than_equals"); loc; lhs_; op_; rhs_] ->
      GreaterThanEquals (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("hex_constant"); loc; token_] ->
      HexConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("identifier"); loc; token_] ->
      Identifier (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("if_statement"); loc; if_; lbrack_; cond_; rbrack_; then_stmt_; else_; else_stmt_] ->
      IfStatement (location_of_sexp loc, ast_of_sexp if_, ast_of_sexp lbrack_, ast_of_sexp cond_, ast_of_sexp rbrack_, ast_of_sexp then_stmt_, ast_of_sexp else_, ast_of_sexp else_stmt_)
  | List [Atom ("imag_expression"); loc; op_; expr_] ->
      ImagExpression (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("include_directive"); loc; incl_] ->
      IncludeDirective (location_of_sexp loc, ast_of_sexp incl_)
  | List [Atom ("initialiser121"); loc; id_; colon_; init_] ->
      Initialiser121 (location_of_sexp loc, ast_of_sexp id_, ast_of_sexp colon_, ast_of_sexp init_)
  | List [Atom ("inline_type_qualifier"); loc; n1_] ->
      InlineTypeQualifier (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("int_type_spec"); loc; int_] ->
      IntTypeSpec (location_of_sexp loc, ast_of_sexp int_)
  | List [Atom ("integer_constant"); loc; token_] ->
      IntegerConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("label_statement"); loc; label_; semi_] ->
      LabelStatement (location_of_sexp loc, ast_of_sexp label_, ast_of_sexp semi_)
  | List [Atom ("left_shift_assign"); loc; lhs_; op_; rhs_] ->
      LeftShiftAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("less_than"); loc; lhs_; op_; rhs_] ->
      LessThan (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("less_than_equals"); loc; lhs_; op_; rhs_] ->
      LessThanEquals (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("line_directive"); loc; hash_; line_; file_; level_] ->
      LineDirective (location_of_sexp loc, ast_of_sexp hash_, ast_of_sexp line_, ast_of_sexp file_, ast_of_sexp level_)
  | List [Atom ("logical_and"); loc; lhs_; op_; rhs_] ->
      LogicalAnd (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("logical_not"); loc; op_; expr_] ->
      LogicalNot (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("logical_or"); loc; lhs_; op_; rhs_] ->
      LogicalOr (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("long_type_spec"); loc; long_] ->
      LongTypeSpec (location_of_sexp loc, ast_of_sexp long_)
  | List [Atom ("modulo"); loc; lhs_; op_; rhs_] ->
      Modulo (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("modulo_assign"); loc; lhs_; op_; rhs_] ->
      ModuloAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("multiply"); loc; lhs_; op_; rhs_] ->
      Multiply (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("multiply_assign"); loc; lhs_; op_; rhs_] ->
      MultiplyAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("negate"); loc; op_; expr_] ->
      Negate (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("node_list"); loc; prev_; sep_; node_] ->
      NodeList (location_of_sexp loc, ast_of_sexp prev_, ast_of_sexp sep_, ast_of_sexp node_)
  | List [Atom ("node_merge"); loc; n1_; n2_] ->
      NodeMerge (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("node_opt"); loc; node_] ->
      NodeOpt (location_of_sexp loc, ast_of_sexp node_)
  | List [Atom ("not_equals"); loc; lhs_; op_; rhs_] ->
      NotEquals (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("octal_constant"); loc; token_] ->
      OctalConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("or_assign"); loc; lhs_; op_; rhs_] ->
      OrAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("parameter_declaration"); loc; attrs_; dspec_; tspec_; declr_] ->
      ParameterDeclaration (location_of_sexp loc, ast_of_sexp attrs_, ast_of_sexp dspec_, ast_of_sexp tspec_, ast_of_sexp declr_)
  | List [Atom ("parameter_declaration156"); loc; attrs_; quals_; defint_] ->
      ParameterDeclaration156 (location_of_sexp loc, ast_of_sexp attrs_, ast_of_sexp quals_, ast_of_sexp defint_)
  | List [Atom ("parameter_declaration157"); loc; attrs_; quals_; defint_; decl_] ->
      ParameterDeclaration157 (location_of_sexp loc, ast_of_sexp attrs_, ast_of_sexp quals_, ast_of_sexp defint_, ast_of_sexp decl_)
  | List [Atom ("parameter_declaration158"); loc; attrs_; quals_; defint_; decl_] ->
      ParameterDeclaration158 (location_of_sexp loc, ast_of_sexp attrs_, ast_of_sexp quals_, ast_of_sexp defint_, ast_of_sexp decl_)
  | List [Atom ("parameter_type_list"); loc; decls_; comma_; ellipsis_] ->
      ParameterTypeList (location_of_sexp loc, ast_of_sexp decls_, ast_of_sexp comma_, ast_of_sexp ellipsis_)
  | List [Atom ("parameter_typedef_declarator70"); loc; tname_] ->
      ParameterTypedefDeclarator70 (location_of_sexp loc, ast_of_sexp tname_)
  | List [Atom ("parameter_typedef_declarator71"); loc; tname_; post_declr_] ->
      ParameterTypedefDeclarator71 (location_of_sexp loc, ast_of_sexp tname_, ast_of_sexp post_declr_)
  | List [Atom ("paren_identifier_declarator"); loc; lbrack_; id_; rbrack_] ->
      ParenIdentifierDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp id_, ast_of_sexp rbrack_)
  | List [Atom ("paren_postfix_typedef_declarator"); loc; lbrack_; tdeclr_; post_declr_; post_declr2_; rbrack_] ->
      ParenPostfixTypedefDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp tdeclr_, ast_of_sexp post_declr_, ast_of_sexp post_declr2_, ast_of_sexp rbrack_)
  | List [Atom ("paren_typedef_declarator"); loc; star_; attrs_; tquals_; lbrack_; tdeclr_; rbrack_] ->
      ParenTypedefDeclarator (location_of_sexp loc, ast_of_sexp star_, ast_of_sexp attrs_, ast_of_sexp tquals_, ast_of_sexp lbrack_, ast_of_sexp tdeclr_, ast_of_sexp rbrack_)
  | List [Atom ("pointer"); loc; star_; attrs_; tquals_; declr_] ->
      Pointer (location_of_sexp loc, ast_of_sexp star_, ast_of_sexp attrs_, ast_of_sexp tquals_, ast_of_sexp declr_)
  | List [Atom ("pointer_access"); loc; lhs_; op_; member_] ->
      PointerAccess (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp member_)
  | List [Atom ("pointer_dereference"); loc; op_; expr_] ->
      PointerDereference (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("positive"); loc; op_; expr_] ->
      Positive (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("post_decrement"); loc; expr_; op_] ->
      PostDecrement (location_of_sexp loc, ast_of_sexp expr_, ast_of_sexp op_)
  | List [Atom ("post_increment"); loc; expr_; op_] ->
      PostIncrement (location_of_sexp loc, ast_of_sexp expr_, ast_of_sexp op_)
  | List [Atom ("postfix_abstract_declarator"); loc; lbrack_; declr_; rbrack_; post_declr_] ->
      PostfixAbstractDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp declr_, ast_of_sexp rbrack_, ast_of_sexp post_declr_)
  | List [Atom ("postfix_identifier_declarator"); loc; lbrack_; declr_; rbrack_; post_declr_] ->
      PostfixIdentifierDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp declr_, ast_of_sexp rbrack_, ast_of_sexp post_declr_)
  | List [Atom ("postfixing_abstract_declarator90"); loc; lbrack_; params_; rbrack_] ->
      PostfixingAbstractDeclarator90 (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp params_, ast_of_sexp rbrack_)
  | List [Atom ("pre_decrement"); loc; op_; expr_] ->
      PreDecrement (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("pre_increment"); loc; op_; expr_] ->
      PreIncrement (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("real_expression"); loc; op_; expr_] ->
      RealExpression (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("register_str_class_spec"); loc; register_] ->
      RegisterStrClassSpec (location_of_sexp loc, ast_of_sexp register_)
  | List [Atom ("restrict_pointer_type_qualifier"); loc; n1_] ->
      RestrictPointerTypeQualifier (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("restrict_type_qualifier"); loc; n1_] ->
      RestrictTypeQualifier (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("return_statement"); loc; return_; expr_; semi_] ->
      ReturnStatement (location_of_sexp loc, ast_of_sexp return_, ast_of_sexp expr_, ast_of_sexp semi_)
  | List [Atom ("right_shift_assign"); loc; lhs_; op_; rhs_] ->
      RightShiftAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("shift_left"); loc; lhs_; op_; rhs_] ->
      ShiftLeft (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("shift_right"); loc; lhs_; op_; rhs_] ->
      ShiftRight (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("short_type_spec"); loc; short_] ->
      ShortTypeSpec (location_of_sexp loc, ast_of_sexp short_)
  | List [Atom ("signer_type_spec"); loc; signed_] ->
      SignerTypeSpec (location_of_sexp loc, ast_of_sexp signed_)
  | List [Atom ("simple_paren_typedef_declarator"); loc; lbrack_; tdeclr_; rbrack_] ->
      SimpleParenTypedefDeclarator (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp tdeclr_, ast_of_sexp rbrack_)
  | List [Atom ("sizeof_type"); loc; op_; lbrack_; expr_; rbrack_] ->
      SizeofType (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("sizeof_var"); loc; op_; expr_] ->
      SizeofVar (location_of_sexp loc, ast_of_sexp op_, ast_of_sexp expr_)
  | List [Atom ("statement350"); loc; n1_] ->
      Statement350 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("static_str_class_spec"); loc; static_] ->
      StaticStrClassSpec (location_of_sexp loc, ast_of_sexp static_)
  | List [Atom ("string_literal"); loc; token_] ->
      StringLiteral (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("struct"); loc; struct_tok_] ->
      Struct (location_of_sexp loc, ast_of_sexp struct_tok_)
  | List [Atom ("struct_access"); loc; lhs_; op_; member_] ->
      StructAccess (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp member_)
  | List [Atom ("struct_declaration"); loc; declrs_; semi_] ->
      StructDeclaration (location_of_sexp loc, ast_of_sexp declrs_, ast_of_sexp semi_)
  | List [Atom ("struct_declaration382"); loc; n1_; n2_] ->
      StructDeclaration382 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("struct_declaration_list"); loc; decl_] ->
      StructDeclarationList (location_of_sexp loc, ast_of_sexp decl_)
  | List [Atom ("struct_declarator"); loc; decl_; bitfield_; attrs_] ->
      StructDeclarator (location_of_sexp loc, ast_of_sexp decl_, ast_of_sexp bitfield_, ast_of_sexp attrs_)
  | List [Atom ("struct_declaring_list325"); loc; tspec_; attrs_; declr_] ->
      StructDeclaringList325 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp attrs_, ast_of_sexp declr_)
  | List [Atom ("struct_declaring_list327"); loc; prev_; sep_; declr_] ->
      StructDeclaringList327 (location_of_sexp loc, ast_of_sexp prev_, ast_of_sexp sep_, ast_of_sexp declr_)
  | List [Atom ("struct_declaring_list392"); loc; n1_; n2_; n3_; n4_] ->
      StructDeclaringList392 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_, ast_of_sexp n3_, ast_of_sexp n4_)
  | List [Atom ("struct_default_declaring_list1"); loc; squals_; id_] ->
      StructDefaultDeclaringList1 (location_of_sexp loc, ast_of_sexp squals_, ast_of_sexp id_)
  | List [Atom ("struct_default_declaring_list2"); loc; prev_; sep_; id_] ->
      StructDefaultDeclaringList2 (location_of_sexp loc, ast_of_sexp prev_, ast_of_sexp sep_, ast_of_sexp id_)
  | List [Atom ("struct_identifier_declarator"); loc; decl_; bitfield_; attrs_] ->
      StructIdentifierDeclarator (location_of_sexp loc, ast_of_sexp decl_, ast_of_sexp bitfield_, ast_of_sexp attrs_)
  | List [Atom ("struct_or_union_specifier"); loc; sudcl_; id_; lbrace_; fields_; rbrace_] ->
      StructOrUnionSpecifier (location_of_sexp loc, ast_of_sexp sudcl_, ast_of_sexp id_, ast_of_sexp lbrace_, ast_of_sexp fields_, ast_of_sexp rbrace_)
  | List [Atom ("subtract"); loc; lhs_; op_; rhs_] ->
      Subtract (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("subtract_assign"); loc; lhs_; op_; rhs_] ->
      SubtractAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | List [Atom ("sue_declaration_specifier25"); loc; tspec_; str_class_] ->
      SueDeclarationSpecifier25 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp str_class_)
  | List [Atom ("sue_declaration_specifier26"); loc; dquals_; tname_; attrs_] ->
      SueDeclarationSpecifier26 (location_of_sexp loc, ast_of_sexp dquals_, ast_of_sexp tname_, ast_of_sexp attrs_)
  | List [Atom ("sue_declaration_specifier27"); loc; dspec_; dqual_] ->
      SueDeclarationSpecifier27 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp dqual_)
  | List [Atom ("sue_type_specifier44"); loc; tquals_; tname_] ->
      SueTypeSpecifier44 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp tname_)
  | List [Atom ("sue_type_specifier46"); loc; tspec_; tqual_] ->
      SueTypeSpecifier46 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp tqual_)
  | List [Atom ("switch_statement"); loc; switch_; lbrack_; expr_; rbrack_; stmt_] ->
      SwitchStatement (location_of_sexp loc, ast_of_sexp switch_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_, ast_of_sexp stmt_)
  | List [Atom ("ternary_op"); loc; cond_; qmark_; then_expr_; colon_; else_expr_] ->
      TernaryOp (location_of_sexp loc, ast_of_sexp cond_, ast_of_sexp qmark_, ast_of_sexp then_expr_, ast_of_sexp colon_, ast_of_sexp else_expr_)
  | List [Atom ("translation_unit"); loc; defs_] ->
      TranslationUnit (location_of_sexp loc, ast_of_sexp defs_)
  | List [Atom ("type_cast"); loc; lbrack_; type_; rbrack_; expr_] ->
      TypeCast (location_of_sexp loc, ast_of_sexp lbrack_, ast_of_sexp type_, ast_of_sexp rbrack_, ast_of_sexp expr_)
  | List [Atom ("type_name"); loc; tspec_; decl_] ->
      TypeName (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp decl_)
  | List [Atom ("type_name151"); loc; tquals_; defint_; decl_] ->
      TypeName151 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp defint_, ast_of_sexp decl_)
  | List [Atom ("type_specifier_nosue387"); loc; n1_] ->
      TypeSpecifierNosue387 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("typedef_declaration_specifier28"); loc; tspec_; str_class_] ->
      TypedefDeclarationSpecifier28 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp str_class_)
  | List [Atom ("typedef_declaration_specifier29"); loc; dquals_; tname_] ->
      TypedefDeclarationSpecifier29 (location_of_sexp loc, ast_of_sexp dquals_, ast_of_sexp tname_)
  | List [Atom ("typedef_declaration_specifier30"); loc; dspec_; dqual_] ->
      TypedefDeclarationSpecifier30 (location_of_sexp loc, ast_of_sexp dspec_, ast_of_sexp dqual_)
  | List [Atom ("typedef_name"); loc; token_] ->
      TypedefName (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("typedef_str_class_spec"); loc; typedef_] ->
      TypedefStrClassSpec (location_of_sexp loc, ast_of_sexp typedef_)
  | List [Atom ("typedef_type_specifier47"); loc; tquals_; tname_] ->
      TypedefTypeSpecifier47 (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp tname_)
  | List [Atom ("typedef_type_specifier49"); loc; tspec_; tqual_] ->
      TypedefTypeSpecifier49 (location_of_sexp loc, ast_of_sexp tspec_, ast_of_sexp tqual_)
  | List [Atom ("typeof_expression388"); loc; n1_] ->
      TypeofExpression388 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("typeof_expression389"); loc; n1_] ->
      TypeofExpression389 (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("typeof_type_specifier"); loc; tquals_; typeof_tok_; lbrack_; expr_; rbrack_] ->
      TypeofTypeSpecifier (location_of_sexp loc, ast_of_sexp tquals_, ast_of_sexp typeof_tok_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp rbrack_)
  | List [Atom ("unary_expression383"); loc; n1_; n2_] ->
      UnaryExpression383 (location_of_sexp loc, ast_of_sexp n1_, ast_of_sexp n2_)
  | List [Atom ("unary_identifier_declarator"); loc; star_; attrs_; tquals_; id_] ->
      UnaryIdentifierDeclarator (location_of_sexp loc, ast_of_sexp star_, ast_of_sexp attrs_, ast_of_sexp tquals_, ast_of_sexp id_)
  | List [Atom ("union"); loc; union_tok_] ->
      Union (location_of_sexp loc, ast_of_sexp union_tok_)
  | List [Atom ("unsigned_type_spec"); loc; unsigned_] ->
      UnsignedTypeSpec (location_of_sexp loc, ast_of_sexp unsigned_)
  | List [Atom ("va_arg_expression"); loc; va_arg_op_; lbrack_; expr_; comma_; type_; rbrack_] ->
      VaArgExpression (location_of_sexp loc, ast_of_sexp va_arg_op_, ast_of_sexp lbrack_, ast_of_sexp expr_, ast_of_sexp comma_, ast_of_sexp type_, ast_of_sexp rbrack_)
  | List [Atom ("va_list_type_spec"); loc; n1_] ->
      VaListTypeSpec (location_of_sexp loc, ast_of_sexp n1_)
  | List [Atom ("void_type_spec"); loc; void_] ->
      VoidTypeSpec (location_of_sexp loc, ast_of_sexp void_)
  | List [Atom ("volatile_type_qualifier"); loc; volatile_] ->
      VolatileTypeQualifier (location_of_sexp loc, ast_of_sexp volatile_)
  | List [Atom ("wchar_constant"); loc; token_] ->
      WcharConstant (location_of_sexp loc, ast_of_sexp token_)
  | List [Atom ("wchar_type_spec"); loc; wchar_] ->
      WcharTypeSpec (location_of_sexp loc, ast_of_sexp wchar_)
  | List [Atom ("while_statement"); loc; while_; lbrack_; cond_; rbrack_; stmt_] ->
      WhileStatement (location_of_sexp loc, ast_of_sexp while_, ast_of_sexp lbrack_, ast_of_sexp cond_, ast_of_sexp rbrack_, ast_of_sexp stmt_)
  | List [Atom ("xor_assign"); loc; lhs_; op_; rhs_] ->
      XorAssign (location_of_sexp loc, ast_of_sexp lhs_, ast_of_sexp op_, ast_of_sexp rhs_)
  | _ -> raise (Conv_error.no_variant_match "ast" x)
;;

let rec sexp_of_ast e =
  match e with
  | Nothing -> Atom ("NIL")
  | Token (loc, kind, lexeme) ->
      List [Atom ("token"); sexp_of_location loc; Atom (string_of_token_kind kind); Atom (lexeme)]
  | AstList (loc, l) ->
      List (List.append [Atom ("ast_list"); sexp_of_location loc] (List.map sexp_of_ast l))
  | Add (loc, lhs_, op_, rhs_) ->
      List [Atom ("add"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | AddAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("add_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | AddressOf (loc, op_, expr_) ->
      List [Atom ("address_of"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | AlignofType (loc, alignof_tok_, lbrack_, type_, rbrack_) ->
      List [Atom ("alignof_type"); sexp_of_location loc; sexp_of_ast alignof_tok_; sexp_of_ast lbrack_; sexp_of_ast type_; sexp_of_ast rbrack_]
  | AlignofVar (loc, alignof_tok_, expr_) ->
      List [Atom ("alignof_var"); sexp_of_location loc; sexp_of_ast alignof_tok_; sexp_of_ast expr_]
  | AndAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("and_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ArrayAbstractDeclarator (loc, lsqbrack_, expr_, rsqbrack_) ->
      List [Atom ("array_abstract_declarator"); sexp_of_location loc; sexp_of_ast lsqbrack_; sexp_of_ast expr_; sexp_of_ast rsqbrack_]
  | ArrayAccess (loc, lhs_, lsqbrack_, rhs_, rsqbrack_) ->
      List [Atom ("array_access"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast lsqbrack_; sexp_of_ast rhs_; sexp_of_ast rsqbrack_]
  | ArrayLabelledInitialised (loc, lsqbrack_, expr_, dots_, expr2_, equals_, rsqbrack_, init_) ->
      List [Atom ("array_labelled_initialised"); sexp_of_location loc; sexp_of_ast lsqbrack_; sexp_of_ast expr_; sexp_of_ast dots_; sexp_of_ast expr2_; sexp_of_ast equals_; sexp_of_ast rsqbrack_; sexp_of_ast init_]
  | Asm361 (loc, n1_, n2_, n3_, n4_) ->
      List [Atom ("asm361"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_; sexp_of_ast n3_; sexp_of_ast n4_]
  | AsmArgument (loc, target_, lbrack_, expr_, rbrack_) ->
      List [Atom ("asm_argument"); sexp_of_location loc; sexp_of_ast target_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | AsmClobbered (loc, clobber_) ->
      List [Atom ("asm_clobbered"); sexp_of_location loc; sexp_of_ast clobber_]
  | AsmStatement (loc, asm_tok_, tquals_, lbrack_, code_, in_arg_colon_, in_args_, out_arg_colon_, out_args_, clobber_colon_, clobbers_, rbrack_, semi_) ->
      List [Atom ("asm_statement"); sexp_of_location loc; sexp_of_ast asm_tok_; sexp_of_ast tquals_; sexp_of_ast lbrack_; sexp_of_ast code_; sexp_of_ast in_arg_colon_; sexp_of_ast in_args_; sexp_of_ast out_arg_colon_; sexp_of_ast out_args_; sexp_of_ast clobber_colon_; sexp_of_ast clobbers_; sexp_of_ast rbrack_; sexp_of_ast semi_]
  | Assign (loc, lhs_, op_, rhs_) ->
      List [Atom ("assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | Attrib375 (loc, n1_) ->
      List [Atom ("attrib375"); sexp_of_location loc; sexp_of_ast n1_]
  | Attrib376 (loc, name_) ->
      List [Atom ("attrib376"); sexp_of_location loc; sexp_of_ast name_]
  | Attrib377 (loc, name_, lbrack_, id_, rbrack_) ->
      List [Atom ("attrib377"); sexp_of_location loc; sexp_of_ast name_; sexp_of_ast lbrack_; sexp_of_ast id_; sexp_of_ast rbrack_]
  | Attrib378 (loc, name_, lbrack_, id_, comma_, expr_, rbrack_) ->
      List [Atom ("attrib378"); sexp_of_location loc; sexp_of_ast name_; sexp_of_ast lbrack_; sexp_of_ast id_; sexp_of_ast comma_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | Attrib379 (loc, name_, lbrack_, expr_, rbrack_) ->
      List [Atom ("attrib379"); sexp_of_location loc; sexp_of_ast name_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | Attribute (loc, attribute_tok_, lbrack1_, lbrack2_, attributes_, rbrack1_, rbrack2_) ->
      List [Atom ("attribute"); sexp_of_location loc; sexp_of_ast attribute_tok_; sexp_of_ast lbrack1_; sexp_of_ast lbrack2_; sexp_of_ast attributes_; sexp_of_ast rbrack1_; sexp_of_ast rbrack2_]
  | Attributes370 (loc, n1_) ->
      List [Atom ("attributes370"); sexp_of_location loc; sexp_of_ast n1_]
  | Attributes371 (loc, n1_, n2_) ->
      List [Atom ("attributes371"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | AutoStrClassSpec (loc, auto_) ->
      List [Atom ("auto_str_class_spec"); sexp_of_location loc; sexp_of_ast auto_]
  | BasicDeclarationSpecifier21 (loc, tspec_, str_class_) ->
      List [Atom ("basic_declaration_specifier21"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast str_class_]
  | BasicDeclarationSpecifier22 (loc, dquals_, tname_) ->
      List [Atom ("basic_declaration_specifier22"); sexp_of_location loc; sexp_of_ast dquals_; sexp_of_ast tname_]
  | BasicDeclarationSpecifier23 (loc, dspec_, dqual_) ->
      List [Atom ("basic_declaration_specifier23"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast dqual_]
  | BasicDeclarationSpecifier24 (loc, dspec_, tname_) ->
      List [Atom ("basic_declaration_specifier24"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast tname_]
  | BasicTypeSpecifier41 (loc, tquals_, tname_) ->
      List [Atom ("basic_type_specifier41"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast tname_]
  | BasicTypeSpecifier42 (loc, tspec_, tqual_) ->
      List [Atom ("basic_type_specifier42"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast tqual_]
  | BasicTypeSpecifier43 (loc, tspec_, tname_) ->
      List [Atom ("basic_type_specifier43"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast tname_]
  | BitFieldSize (loc, colon_, expr_) ->
      List [Atom ("bit_field_size"); sexp_of_location loc; sexp_of_ast colon_; sexp_of_ast expr_]
  | BitwiseAnd (loc, lhs_, op_, rhs_) ->
      List [Atom ("bitwise_and"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | BitwiseNegate (loc, op_, expr_) ->
      List [Atom ("bitwise_negate"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | BitwiseOr (loc, lhs_, op_, rhs_) ->
      List [Atom ("bitwise_or"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | BitwiseXor (loc, lhs_, op_, rhs_) ->
      List [Atom ("bitwise_xor"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | BraceExpression (loc, lbrack_, body_, rbrack_) ->
      List [Atom ("brace_expression"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast body_; sexp_of_ast rbrack_]
  | BracketExpression (loc, lbrack_, expr_, rbrack_) ->
      List [Atom ("bracket_expression"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | BracketedInitialiserList (loc, lbrack_, list_, comma_, rbrack_) ->
      List [Atom ("bracketed_initialiser_list"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast list_; sexp_of_ast comma_; sexp_of_ast rbrack_]
  | BreakStatement (loc, break_, semi_) ->
      List [Atom ("break_statement"); sexp_of_location loc; sexp_of_ast break_; sexp_of_ast semi_]
  | CaseLabelStatement (loc, case_, expr_, semi_) ->
      List [Atom ("case_label_statement"); sexp_of_location loc; sexp_of_ast case_; sexp_of_ast expr_; sexp_of_ast semi_]
  | CharConstant (loc, token_) ->
      List [Atom ("char_constant"); sexp_of_location loc; sexp_of_ast token_]
  | CharTypeSpec (loc, char_) ->
      List [Atom ("char_type_spec"); sexp_of_location loc; sexp_of_ast char_]
  | CleanPostfixTypedefDeclarator (loc, lbrack_, tdeclr_, rbrack_, post_declr_) ->
      List [Atom ("clean_postfix_typedef_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast tdeclr_; sexp_of_ast rbrack_; sexp_of_ast post_declr_]
  | CleanTypedefDeclarator (loc, star_, attrs_, tquals_, tdeclr_) ->
      List [Atom ("clean_typedef_declarator"); sexp_of_location loc; sexp_of_ast star_; sexp_of_ast attrs_; sexp_of_ast tquals_; sexp_of_ast tdeclr_]
  | CommaExpression (loc, exprs_) ->
      List [Atom ("comma_expression"); sexp_of_location loc; sexp_of_ast exprs_]
  | ComplexTypeQualifier (loc, n1_) ->
      List [Atom ("complex_type_qualifier"); sexp_of_location loc; sexp_of_ast n1_]
  | CompoundLiteral (loc, lbrack_, type_, rbrack_, init_list_) ->
      List [Atom ("compound_literal"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast type_; sexp_of_ast rbrack_; sexp_of_ast init_list_]
  | CompoundStatement (loc, lbrace_, stmts_, rbrace_) ->
      List [Atom ("compound_statement"); sexp_of_location loc; sexp_of_ast lbrace_; sexp_of_ast stmts_; sexp_of_ast rbrace_]
  | ConstTypeQualifier (loc, const_) ->
      List [Atom ("const_type_qualifier"); sexp_of_location loc; sexp_of_ast const_]
  | ContinueStatement (loc, continue_, semi_) ->
      List [Atom ("continue_statement"); sexp_of_location loc; sexp_of_ast continue_; sexp_of_ast semi_]
  | DeclInitialiser (loc, equals_, init_) ->
      List [Atom ("decl_initialiser"); sexp_of_location loc; sexp_of_ast equals_; sexp_of_ast init_]
  | Declaration1 (loc, declrs_, semi_) ->
      List [Atom ("declaration1"); sexp_of_location loc; sexp_of_ast declrs_; sexp_of_ast semi_]
  | Declaration3 (loc, dspec_, semi_) ->
      List [Atom ("declaration3"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast semi_]
  | Declaration4 (loc, tspec_, semi_) ->
      List [Atom ("declaration4"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast semi_]
  | DeclarationQualifierList31 (loc, tquals_, attrs_, str_class_, attrs2_) ->
      List [Atom ("declaration_qualifier_list31"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast attrs_; sexp_of_ast str_class_; sexp_of_ast attrs2_]
  | DeclarationQualifierList33 (loc, dquals_, dqual_) ->
      List [Atom ("declaration_qualifier_list33"); sexp_of_location loc; sexp_of_ast dquals_; sexp_of_ast dqual_]
  | Declarator384 (loc, n1_, n2_) ->
      List [Atom ("declarator384"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | DeclaringList10 (loc, dspec_, attrs_, declr_, register_, attrs2_, init_) ->
      List [Atom ("declaring_list10"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast attrs_; sexp_of_ast declr_; sexp_of_ast register_; sexp_of_ast attrs2_; sexp_of_ast init_]
  | DeclaringList11 (loc, tspec_, declr_, register_, attrs2_, init_) ->
      List [Atom ("declaring_list11"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast declr_; sexp_of_ast register_; sexp_of_ast attrs2_; sexp_of_ast init_]
  | DeclaringList12 (loc, tspec_, attrs_, declr_, register_, attrs2_, init_) ->
      List [Atom ("declaring_list12"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast attrs_; sexp_of_ast declr_; sexp_of_ast register_; sexp_of_ast attrs2_; sexp_of_ast init_]
  | DeclaringList13 (loc, prev_, sep_, declr_, register_, attrs2_, init_) ->
      List [Atom ("declaring_list13"); sexp_of_location loc; sexp_of_ast prev_; sexp_of_ast sep_; sexp_of_ast declr_; sexp_of_ast register_; sexp_of_ast attrs2_; sexp_of_ast init_]
  | DeclaringList9 (loc, dspec_, declr_, register_, attrs2_, init_) ->
      List [Atom ("declaring_list9"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast declr_; sexp_of_ast register_; sexp_of_ast attrs2_; sexp_of_ast init_]
  | DefaultDeclaringList14 (loc, dquals_, id_, attrs_, init_) ->
      List [Atom ("default_declaring_list14"); sexp_of_location loc; sexp_of_ast dquals_; sexp_of_ast id_; sexp_of_ast attrs_; sexp_of_ast init_]
  | DefaultDeclaringList15 (loc, tquals_, id_, attrs_, init_) ->
      List [Atom ("default_declaring_list15"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast id_; sexp_of_ast attrs_; sexp_of_ast init_]
  | DefaultDeclaringList16 (loc, prev_, sep_, id_, attrs_, init_) ->
      List [Atom ("default_declaring_list16"); sexp_of_location loc; sexp_of_ast prev_; sexp_of_ast sep_; sexp_of_ast id_; sexp_of_ast attrs_; sexp_of_ast init_]
  | DefaultLabelStatement (loc, default_, semi_) ->
      List [Atom ("default_label_statement"); sexp_of_location loc; sexp_of_ast default_; sexp_of_ast semi_]
  | DesignatedInitialiser (loc, dot_, id_, equals_, init_) ->
      List [Atom ("designated_initialiser"); sexp_of_location loc; sexp_of_ast dot_; sexp_of_ast id_; sexp_of_ast equals_; sexp_of_ast init_]
  | Divide (loc, lhs_, op_, rhs_) ->
      List [Atom ("divide"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | DivideAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("divide_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | DoStatement (loc, do_, stmt_, while_, lbrack_, cond_, rbrack_, semi_) ->
      List [Atom ("do_statement"); sexp_of_location loc; sexp_of_ast do_; sexp_of_ast stmt_; sexp_of_ast while_; sexp_of_ast lbrack_; sexp_of_ast cond_; sexp_of_ast rbrack_; sexp_of_ast semi_]
  | DoubleTypeSpec (loc, double_) ->
      List [Atom ("double_type_spec"); sexp_of_location loc; sexp_of_ast double_]
  | EnumSpecifier (loc, enum_tok_, tag_, lbrace_, values_, comma_, rbrace_) ->
      List [Atom ("enum_specifier"); sexp_of_location loc; sexp_of_ast enum_tok_; sexp_of_ast tag_; sexp_of_ast lbrace_; sexp_of_ast values_; sexp_of_ast comma_; sexp_of_ast rbrace_]
  | Enumerator (loc, id_, value_) ->
      List [Atom ("enumerator"); sexp_of_location loc; sexp_of_ast id_; sexp_of_ast value_]
  | EnumeratorValue (loc, equals_, expr_) ->
      List [Atom ("enumerator_value"); sexp_of_location loc; sexp_of_ast equals_; sexp_of_ast expr_]
  | Equals (loc, lhs_, op_, rhs_) ->
      List [Atom ("equals"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ExpressionStatement (loc, expr_, semi_) ->
      List [Atom ("expression_statement"); sexp_of_location loc; sexp_of_ast expr_; sexp_of_ast semi_]
  | ExternStrClassSpec (loc, extern_) ->
      List [Atom ("extern_str_class_spec"); sexp_of_location loc; sexp_of_ast extern_]
  | ExternalDefinition385 (loc, n1_, n2_) ->
      List [Atom ("external_definition385"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | FloatTypeSpec (loc, float_) ->
      List [Atom ("float_type_spec"); sexp_of_location loc; sexp_of_ast float_]
  | FloatingConstant (loc, token_) ->
      List [Atom ("floating_constant"); sexp_of_location loc; sexp_of_ast token_]
  | ForStatement (loc, for_, lbrack_, init_, init_semi_, cond_, cond_semi_, inc_, rbrack_, stmt_) ->
      List [Atom ("for_statement"); sexp_of_location loc; sexp_of_ast for_; sexp_of_ast lbrack_; sexp_of_ast init_; sexp_of_ast init_semi_; sexp_of_ast cond_; sexp_of_ast cond_semi_; sexp_of_ast inc_; sexp_of_ast rbrack_; sexp_of_ast stmt_]
  | FunctionCall (loc, lhs_, lbrack_, args_, rbrack_) ->
      List [Atom ("function_call"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast lbrack_; sexp_of_ast args_; sexp_of_ast rbrack_]
  | FunctionDeclaration (loc, spec_, attrs_, id_, body_) ->
      List [Atom ("function_declaration"); sexp_of_location loc; sexp_of_ast spec_; sexp_of_ast attrs_; sexp_of_ast id_; sexp_of_ast body_]
  | FunctionDefinition (loc, declarator_, body_) ->
      List [Atom ("function_definition"); sexp_of_location loc; sexp_of_ast declarator_; sexp_of_ast body_]
  | FunctionDefinitionDqual (loc, dqual_, declarator_, body_) ->
      List [Atom ("function_definition_dqual"); sexp_of_location loc; sexp_of_ast dqual_; sexp_of_ast declarator_; sexp_of_ast body_]
  | FunctionDefinitionTqual (loc, tqual_, declarator_, body_) ->
      List [Atom ("function_definition_tqual"); sexp_of_location loc; sexp_of_ast tqual_; sexp_of_ast declarator_; sexp_of_ast body_]
  | GccExtension386 (loc, n1_) ->
      List [Atom ("gcc_extension386"); sexp_of_location loc; sexp_of_ast n1_]
  | GotoStatement (loc, goto_, label_, semi_) ->
      List [Atom ("goto_statement"); sexp_of_location loc; sexp_of_ast goto_; sexp_of_ast label_; sexp_of_ast semi_]
  | GreaterThan (loc, lhs_, op_, rhs_) ->
      List [Atom ("greater_than"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | GreaterThanEquals (loc, lhs_, op_, rhs_) ->
      List [Atom ("greater_than_equals"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | HexConstant (loc, token_) ->
      List [Atom ("hex_constant"); sexp_of_location loc; sexp_of_ast token_]
  | Identifier (loc, token_) ->
      List [Atom ("identifier"); sexp_of_location loc; sexp_of_ast token_]
  | IfStatement (loc, if_, lbrack_, cond_, rbrack_, then_stmt_, else_, else_stmt_) ->
      List [Atom ("if_statement"); sexp_of_location loc; sexp_of_ast if_; sexp_of_ast lbrack_; sexp_of_ast cond_; sexp_of_ast rbrack_; sexp_of_ast then_stmt_; sexp_of_ast else_; sexp_of_ast else_stmt_]
  | ImagExpression (loc, op_, expr_) ->
      List [Atom ("imag_expression"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | IncludeDirective (loc, incl_) ->
      List [Atom ("include_directive"); sexp_of_location loc; sexp_of_ast incl_]
  | Initialiser121 (loc, id_, colon_, init_) ->
      List [Atom ("initialiser121"); sexp_of_location loc; sexp_of_ast id_; sexp_of_ast colon_; sexp_of_ast init_]
  | InlineTypeQualifier (loc, n1_) ->
      List [Atom ("inline_type_qualifier"); sexp_of_location loc; sexp_of_ast n1_]
  | IntTypeSpec (loc, int_) ->
      List [Atom ("int_type_spec"); sexp_of_location loc; sexp_of_ast int_]
  | IntegerConstant (loc, token_) ->
      List [Atom ("integer_constant"); sexp_of_location loc; sexp_of_ast token_]
  | LabelStatement (loc, label_, semi_) ->
      List [Atom ("label_statement"); sexp_of_location loc; sexp_of_ast label_; sexp_of_ast semi_]
  | LeftShiftAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("left_shift_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | LessThan (loc, lhs_, op_, rhs_) ->
      List [Atom ("less_than"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | LessThanEquals (loc, lhs_, op_, rhs_) ->
      List [Atom ("less_than_equals"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | LineDirective (loc, hash_, line_, file_, level_) ->
      List [Atom ("line_directive"); sexp_of_location loc; sexp_of_ast hash_; sexp_of_ast line_; sexp_of_ast file_; sexp_of_ast level_]
  | LogicalAnd (loc, lhs_, op_, rhs_) ->
      List [Atom ("logical_and"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | LogicalNot (loc, op_, expr_) ->
      List [Atom ("logical_not"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | LogicalOr (loc, lhs_, op_, rhs_) ->
      List [Atom ("logical_or"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | LongTypeSpec (loc, long_) ->
      List [Atom ("long_type_spec"); sexp_of_location loc; sexp_of_ast long_]
  | Modulo (loc, lhs_, op_, rhs_) ->
      List [Atom ("modulo"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ModuloAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("modulo_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | Multiply (loc, lhs_, op_, rhs_) ->
      List [Atom ("multiply"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | MultiplyAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("multiply_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | Negate (loc, op_, expr_) ->
      List [Atom ("negate"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | NodeList (loc, prev_, sep_, node_) ->
      List [Atom ("node_list"); sexp_of_location loc; sexp_of_ast prev_; sexp_of_ast sep_; sexp_of_ast node_]
  | NodeMerge (loc, n1_, n2_) ->
      List [Atom ("node_merge"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | NodeOpt (loc, node_) ->
      List [Atom ("node_opt"); sexp_of_location loc; sexp_of_ast node_]
  | NotEquals (loc, lhs_, op_, rhs_) ->
      List [Atom ("not_equals"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | OctalConstant (loc, token_) ->
      List [Atom ("octal_constant"); sexp_of_location loc; sexp_of_ast token_]
  | OrAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("or_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ParameterDeclaration (loc, attrs_, dspec_, tspec_, declr_) ->
      List [Atom ("parameter_declaration"); sexp_of_location loc; sexp_of_ast attrs_; sexp_of_ast dspec_; sexp_of_ast tspec_; sexp_of_ast declr_]
  | ParameterDeclaration156 (loc, attrs_, quals_, defint_) ->
      List [Atom ("parameter_declaration156"); sexp_of_location loc; sexp_of_ast attrs_; sexp_of_ast quals_; sexp_of_ast defint_]
  | ParameterDeclaration157 (loc, attrs_, quals_, defint_, decl_) ->
      List [Atom ("parameter_declaration157"); sexp_of_location loc; sexp_of_ast attrs_; sexp_of_ast quals_; sexp_of_ast defint_; sexp_of_ast decl_]
  | ParameterDeclaration158 (loc, attrs_, quals_, defint_, decl_) ->
      List [Atom ("parameter_declaration158"); sexp_of_location loc; sexp_of_ast attrs_; sexp_of_ast quals_; sexp_of_ast defint_; sexp_of_ast decl_]
  | ParameterTypeList (loc, decls_, comma_, ellipsis_) ->
      List [Atom ("parameter_type_list"); sexp_of_location loc; sexp_of_ast decls_; sexp_of_ast comma_; sexp_of_ast ellipsis_]
  | ParameterTypedefDeclarator70 (loc, tname_) ->
      List [Atom ("parameter_typedef_declarator70"); sexp_of_location loc; sexp_of_ast tname_]
  | ParameterTypedefDeclarator71 (loc, tname_, post_declr_) ->
      List [Atom ("parameter_typedef_declarator71"); sexp_of_location loc; sexp_of_ast tname_; sexp_of_ast post_declr_]
  | ParenIdentifierDeclarator (loc, lbrack_, id_, rbrack_) ->
      List [Atom ("paren_identifier_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast id_; sexp_of_ast rbrack_]
  | ParenPostfixTypedefDeclarator (loc, lbrack_, tdeclr_, post_declr_, post_declr2_, rbrack_) ->
      List [Atom ("paren_postfix_typedef_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast tdeclr_; sexp_of_ast post_declr_; sexp_of_ast post_declr2_; sexp_of_ast rbrack_]
  | ParenTypedefDeclarator (loc, star_, attrs_, tquals_, lbrack_, tdeclr_, rbrack_) ->
      List [Atom ("paren_typedef_declarator"); sexp_of_location loc; sexp_of_ast star_; sexp_of_ast attrs_; sexp_of_ast tquals_; sexp_of_ast lbrack_; sexp_of_ast tdeclr_; sexp_of_ast rbrack_]
  | Pointer (loc, star_, attrs_, tquals_, declr_) ->
      List [Atom ("pointer"); sexp_of_location loc; sexp_of_ast star_; sexp_of_ast attrs_; sexp_of_ast tquals_; sexp_of_ast declr_]
  | PointerAccess (loc, lhs_, op_, member_) ->
      List [Atom ("pointer_access"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast member_]
  | PointerDereference (loc, op_, expr_) ->
      List [Atom ("pointer_dereference"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | Positive (loc, op_, expr_) ->
      List [Atom ("positive"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | PostDecrement (loc, expr_, op_) ->
      List [Atom ("post_decrement"); sexp_of_location loc; sexp_of_ast expr_; sexp_of_ast op_]
  | PostIncrement (loc, expr_, op_) ->
      List [Atom ("post_increment"); sexp_of_location loc; sexp_of_ast expr_; sexp_of_ast op_]
  | PostfixAbstractDeclarator (loc, lbrack_, declr_, rbrack_, post_declr_) ->
      List [Atom ("postfix_abstract_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast declr_; sexp_of_ast rbrack_; sexp_of_ast post_declr_]
  | PostfixIdentifierDeclarator (loc, lbrack_, declr_, rbrack_, post_declr_) ->
      List [Atom ("postfix_identifier_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast declr_; sexp_of_ast rbrack_; sexp_of_ast post_declr_]
  | PostfixingAbstractDeclarator90 (loc, lbrack_, params_, rbrack_) ->
      List [Atom ("postfixing_abstract_declarator90"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast params_; sexp_of_ast rbrack_]
  | PreDecrement (loc, op_, expr_) ->
      List [Atom ("pre_decrement"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | PreIncrement (loc, op_, expr_) ->
      List [Atom ("pre_increment"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | RealExpression (loc, op_, expr_) ->
      List [Atom ("real_expression"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | RegisterStrClassSpec (loc, register_) ->
      List [Atom ("register_str_class_spec"); sexp_of_location loc; sexp_of_ast register_]
  | RestrictPointerTypeQualifier (loc, n1_) ->
      List [Atom ("restrict_pointer_type_qualifier"); sexp_of_location loc; sexp_of_ast n1_]
  | RestrictTypeQualifier (loc, n1_) ->
      List [Atom ("restrict_type_qualifier"); sexp_of_location loc; sexp_of_ast n1_]
  | ReturnStatement (loc, return_, expr_, semi_) ->
      List [Atom ("return_statement"); sexp_of_location loc; sexp_of_ast return_; sexp_of_ast expr_; sexp_of_ast semi_]
  | RightShiftAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("right_shift_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ShiftLeft (loc, lhs_, op_, rhs_) ->
      List [Atom ("shift_left"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ShiftRight (loc, lhs_, op_, rhs_) ->
      List [Atom ("shift_right"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | ShortTypeSpec (loc, short_) ->
      List [Atom ("short_type_spec"); sexp_of_location loc; sexp_of_ast short_]
  | SignerTypeSpec (loc, signed_) ->
      List [Atom ("signer_type_spec"); sexp_of_location loc; sexp_of_ast signed_]
  | SimpleParenTypedefDeclarator (loc, lbrack_, tdeclr_, rbrack_) ->
      List [Atom ("simple_paren_typedef_declarator"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast tdeclr_; sexp_of_ast rbrack_]
  | SizeofType (loc, op_, lbrack_, expr_, rbrack_) ->
      List [Atom ("sizeof_type"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | SizeofVar (loc, op_, expr_) ->
      List [Atom ("sizeof_var"); sexp_of_location loc; sexp_of_ast op_; sexp_of_ast expr_]
  | Statement350 (loc, n1_) ->
      List [Atom ("statement350"); sexp_of_location loc; sexp_of_ast n1_]
  | StaticStrClassSpec (loc, static_) ->
      List [Atom ("static_str_class_spec"); sexp_of_location loc; sexp_of_ast static_]
  | StringLiteral (loc, token_) ->
      List [Atom ("string_literal"); sexp_of_location loc; sexp_of_ast token_]
  | Struct (loc, struct_tok_) ->
      List [Atom ("struct"); sexp_of_location loc; sexp_of_ast struct_tok_]
  | StructAccess (loc, lhs_, op_, member_) ->
      List [Atom ("struct_access"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast member_]
  | StructDeclaration (loc, declrs_, semi_) ->
      List [Atom ("struct_declaration"); sexp_of_location loc; sexp_of_ast declrs_; sexp_of_ast semi_]
  | StructDeclaration382 (loc, n1_, n2_) ->
      List [Atom ("struct_declaration382"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | StructDeclarationList (loc, decl_) ->
      List [Atom ("struct_declaration_list"); sexp_of_location loc; sexp_of_ast decl_]
  | StructDeclarator (loc, decl_, bitfield_, attrs_) ->
      List [Atom ("struct_declarator"); sexp_of_location loc; sexp_of_ast decl_; sexp_of_ast bitfield_; sexp_of_ast attrs_]
  | StructDeclaringList325 (loc, tspec_, attrs_, declr_) ->
      List [Atom ("struct_declaring_list325"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast attrs_; sexp_of_ast declr_]
  | StructDeclaringList327 (loc, prev_, sep_, declr_) ->
      List [Atom ("struct_declaring_list327"); sexp_of_location loc; sexp_of_ast prev_; sexp_of_ast sep_; sexp_of_ast declr_]
  | StructDeclaringList392 (loc, n1_, n2_, n3_, n4_) ->
      List [Atom ("struct_declaring_list392"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_; sexp_of_ast n3_; sexp_of_ast n4_]
  | StructDefaultDeclaringList1 (loc, squals_, id_) ->
      List [Atom ("struct_default_declaring_list1"); sexp_of_location loc; sexp_of_ast squals_; sexp_of_ast id_]
  | StructDefaultDeclaringList2 (loc, prev_, sep_, id_) ->
      List [Atom ("struct_default_declaring_list2"); sexp_of_location loc; sexp_of_ast prev_; sexp_of_ast sep_; sexp_of_ast id_]
  | StructIdentifierDeclarator (loc, decl_, bitfield_, attrs_) ->
      List [Atom ("struct_identifier_declarator"); sexp_of_location loc; sexp_of_ast decl_; sexp_of_ast bitfield_; sexp_of_ast attrs_]
  | StructOrUnionSpecifier (loc, sudcl_, id_, lbrace_, fields_, rbrace_) ->
      List [Atom ("struct_or_union_specifier"); sexp_of_location loc; sexp_of_ast sudcl_; sexp_of_ast id_; sexp_of_ast lbrace_; sexp_of_ast fields_; sexp_of_ast rbrace_]
  | Subtract (loc, lhs_, op_, rhs_) ->
      List [Atom ("subtract"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | SubtractAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("subtract_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
  | SueDeclarationSpecifier25 (loc, tspec_, str_class_) ->
      List [Atom ("sue_declaration_specifier25"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast str_class_]
  | SueDeclarationSpecifier26 (loc, dquals_, tname_, attrs_) ->
      List [Atom ("sue_declaration_specifier26"); sexp_of_location loc; sexp_of_ast dquals_; sexp_of_ast tname_; sexp_of_ast attrs_]
  | SueDeclarationSpecifier27 (loc, dspec_, dqual_) ->
      List [Atom ("sue_declaration_specifier27"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast dqual_]
  | SueTypeSpecifier44 (loc, tquals_, tname_) ->
      List [Atom ("sue_type_specifier44"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast tname_]
  | SueTypeSpecifier46 (loc, tspec_, tqual_) ->
      List [Atom ("sue_type_specifier46"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast tqual_]
  | SwitchStatement (loc, switch_, lbrack_, expr_, rbrack_, stmt_) ->
      List [Atom ("switch_statement"); sexp_of_location loc; sexp_of_ast switch_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_; sexp_of_ast stmt_]
  | TernaryOp (loc, cond_, qmark_, then_expr_, colon_, else_expr_) ->
      List [Atom ("ternary_op"); sexp_of_location loc; sexp_of_ast cond_; sexp_of_ast qmark_; sexp_of_ast then_expr_; sexp_of_ast colon_; sexp_of_ast else_expr_]
  | TranslationUnit (loc, defs_) ->
      List [Atom ("translation_unit"); sexp_of_location loc; sexp_of_ast defs_]
  | TypeCast (loc, lbrack_, type_, rbrack_, expr_) ->
      List [Atom ("type_cast"); sexp_of_location loc; sexp_of_ast lbrack_; sexp_of_ast type_; sexp_of_ast rbrack_; sexp_of_ast expr_]
  | TypeName (loc, tspec_, decl_) ->
      List [Atom ("type_name"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast decl_]
  | TypeName151 (loc, tquals_, defint_, decl_) ->
      List [Atom ("type_name151"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast defint_; sexp_of_ast decl_]
  | TypeSpecifierNosue387 (loc, n1_) ->
      List [Atom ("type_specifier_nosue387"); sexp_of_location loc; sexp_of_ast n1_]
  | TypedefDeclarationSpecifier28 (loc, tspec_, str_class_) ->
      List [Atom ("typedef_declaration_specifier28"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast str_class_]
  | TypedefDeclarationSpecifier29 (loc, dquals_, tname_) ->
      List [Atom ("typedef_declaration_specifier29"); sexp_of_location loc; sexp_of_ast dquals_; sexp_of_ast tname_]
  | TypedefDeclarationSpecifier30 (loc, dspec_, dqual_) ->
      List [Atom ("typedef_declaration_specifier30"); sexp_of_location loc; sexp_of_ast dspec_; sexp_of_ast dqual_]
  | TypedefName (loc, token_) ->
      List [Atom ("typedef_name"); sexp_of_location loc; sexp_of_ast token_]
  | TypedefStrClassSpec (loc, typedef_) ->
      List [Atom ("typedef_str_class_spec"); sexp_of_location loc; sexp_of_ast typedef_]
  | TypedefTypeSpecifier47 (loc, tquals_, tname_) ->
      List [Atom ("typedef_type_specifier47"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast tname_]
  | TypedefTypeSpecifier49 (loc, tspec_, tqual_) ->
      List [Atom ("typedef_type_specifier49"); sexp_of_location loc; sexp_of_ast tspec_; sexp_of_ast tqual_]
  | TypeofExpression388 (loc, n1_) ->
      List [Atom ("typeof_expression388"); sexp_of_location loc; sexp_of_ast n1_]
  | TypeofExpression389 (loc, n1_) ->
      List [Atom ("typeof_expression389"); sexp_of_location loc; sexp_of_ast n1_]
  | TypeofTypeSpecifier (loc, tquals_, typeof_tok_, lbrack_, expr_, rbrack_) ->
      List [Atom ("typeof_type_specifier"); sexp_of_location loc; sexp_of_ast tquals_; sexp_of_ast typeof_tok_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast rbrack_]
  | UnaryExpression383 (loc, n1_, n2_) ->
      List [Atom ("unary_expression383"); sexp_of_location loc; sexp_of_ast n1_; sexp_of_ast n2_]
  | UnaryIdentifierDeclarator (loc, star_, attrs_, tquals_, id_) ->
      List [Atom ("unary_identifier_declarator"); sexp_of_location loc; sexp_of_ast star_; sexp_of_ast attrs_; sexp_of_ast tquals_; sexp_of_ast id_]
  | Union (loc, union_tok_) ->
      List [Atom ("union"); sexp_of_location loc; sexp_of_ast union_tok_]
  | UnsignedTypeSpec (loc, unsigned_) ->
      List [Atom ("unsigned_type_spec"); sexp_of_location loc; sexp_of_ast unsigned_]
  | VaArgExpression (loc, va_arg_op_, lbrack_, expr_, comma_, type_, rbrack_) ->
      List [Atom ("va_arg_expression"); sexp_of_location loc; sexp_of_ast va_arg_op_; sexp_of_ast lbrack_; sexp_of_ast expr_; sexp_of_ast comma_; sexp_of_ast type_; sexp_of_ast rbrack_]
  | VaListTypeSpec (loc, n1_) ->
      List [Atom ("va_list_type_spec"); sexp_of_location loc; sexp_of_ast n1_]
  | VoidTypeSpec (loc, void_) ->
      List [Atom ("void_type_spec"); sexp_of_location loc; sexp_of_ast void_]
  | VolatileTypeQualifier (loc, volatile_) ->
      List [Atom ("volatile_type_qualifier"); sexp_of_location loc; sexp_of_ast volatile_]
  | WcharConstant (loc, token_) ->
      List [Atom ("wchar_constant"); sexp_of_location loc; sexp_of_ast token_]
  | WcharTypeSpec (loc, wchar_) ->
      List [Atom ("wchar_type_spec"); sexp_of_location loc; sexp_of_ast wchar_]
  | WhileStatement (loc, while_, lbrack_, cond_, rbrack_, stmt_) ->
      List [Atom ("while_statement"); sexp_of_location loc; sexp_of_ast while_; sexp_of_ast lbrack_; sexp_of_ast cond_; sexp_of_ast rbrack_; sexp_of_ast stmt_]
  | XorAssign (loc, lhs_, op_, rhs_) ->
      List [Atom ("xor_assign"); sexp_of_location loc; sexp_of_ast lhs_; sexp_of_ast op_; sexp_of_ast rhs_]
;;
