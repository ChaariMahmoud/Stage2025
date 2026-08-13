grammar SafeWasmSpec;

@lexer::namespace {
WasmToBoogie.Spec.Generated
}

@parser::namespace {
WasmToBoogie.Spec.Generated
}

specification
    : directive EOF
    ;

directive
    : REQUIRES expression       # RequiresDirective
    | ENSURES expression        # EnsuresDirective
    | GLOBAL_INVARIANT expression
                                # GlobalInvariantDirective
    | INVARIANT expression      # InvariantDirective
    | ASSERT expression         # AssertDirective
    | ASSUME expression         # AssumeDirective
    ;

/*
 * Priorité la plus faible : ||
 */
expression
    : logicalOrExpression
    ;

logicalOrExpression
    : logicalAndExpression (OR logicalAndExpression)*
    ;

logicalAndExpression
    : equalityExpression (AND equalityExpression)*
    ;

equalityExpression
    : relationalExpression
      ((EQUAL | NOT_EQUAL) relationalExpression)*
    ;

relationalExpression
    : additiveExpression
      ((LESS
        | LESS_EQUAL
        | GREATER
        | GREATER_EQUAL) additiveExpression)*
    ;

additiveExpression
    : multiplicativeExpression
      ((PLUS | MINUS) multiplicativeExpression)*
    ;

multiplicativeExpression
    : unaryExpression
      ((MULTIPLY | DIVIDE | MODULO) unaryExpression)*
    ;

unaryExpression
    : NOT unaryExpression        # LogicalNotExpression
    | MINUS unaryExpression      # NegationExpression
    | postfixExpression          # PostfixUnaryExpression
    ;

postfixExpression
    : primaryExpression postfixOperation*
    ;

postfixOperation
    : LBRACKET expression RBRACKET   # IndexPostfixOperation
    | DOT identifier                  # FieldPostfixOperation
    ;

primaryExpression
    : INTEGER                    # IntegerExpression
    | TRUE                       # TrueExpression
    | FALSE                      # FalseExpression
    | RESULT                     # ResultExpression
    | OLD LPAREN expression RPAREN
                                 # OldExpression
    | identifier                 # IdentifierExpression
    | LPAREN expression RPAREN   # ParenthesizedExpression
    ;

identifier
    : IDENTIFIER
    | DOLLAR_IDENTIFIER
    ;

/*
 * Directives
 */
REQUIRES
    : '@requires'
    ;

ENSURES
    : '@ensures'
    ;

GLOBAL_INVARIANT
    : '@global_invariant'
    | '@inv'
    ;

INVARIANT
    : '@invariant'
    ;

ASSERT
    : '@assert'
    ;

ASSUME
    : '@assume'
    ;

/*
 * Mots réservés
 */
OLD
    : 'old'
    ;

RESULT
    : 'result'
    ;

TRUE
    : 'true'
    ;

FALSE
    : 'false'
    ;

/*
 * Opérateurs
 */
AND
    : '&&'
    ;

OR
    : '||'
    ;

NOT
    : '!'
    ;

EQUAL
    : '=='
    ;

NOT_EQUAL
    : '!='
    ;

LESS_EQUAL
    : '<='
    ;

GREATER_EQUAL
    : '>='
    ;

LESS
    : '<'
    ;

GREATER
    : '>'
    ;

PLUS
    : '+'
    ;

MINUS
    : '-'
    ;

MULTIPLY
    : '*'
    ;

DIVIDE
    : '/'
    ;

MODULO
    : '%'
    ;

LPAREN
    : '('
    ;

RPAREN
    : ')'
    ;

/*
 * Identifiants WAT :
 *
 *   active_requests
 *   MAX_REQUESTS
 *   $active_requests
 */
DOLLAR_IDENTIFIER
    : '$' [A-Za-z_] [A-Za-z0-9_.$-]*
    ;

IDENTIFIER
    : [A-Za-z_] [A-Za-z0-9_.$-]*
    ;

INTEGER
    : [0-9]+
    ;

WS
    : [ \t\r\n]+ -> skip
    ;