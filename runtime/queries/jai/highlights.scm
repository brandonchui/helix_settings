; Includes

[
 (import)
 (load)
] @keyword.control.import

; Keywords

[
 "xx"
 "null"
 "enum"
 "cast"
 "using"
 "defer"
 "union"
 "struct"
 "inline"
 "remove"
 "type_of"
 "operator"
 "no_inline"
 "interface"
 "enum_flags"
 "push_context"
] @keyword

[
 "return"
] @keyword.control.return

[
 "if"
 "ifx"
 "then"
 "else"
 "case"
 "break"
] @keyword.control.conditional

[
 "for"
 "while"
 "continue"
] @keyword.control.repeat

; Variables

name: (identifier) @variable
argument: (identifier) @variable
named_argument: (identifier) @variable
(member_expression (identifier) @variable)
(parenthesized_expression (identifier) @variable)

((identifier) @variable.builtin
 (#any-of? @variable.builtin "context" "it" "it_index"))

; Namespaces

(import (identifier) @namespace)

; Parameters

(parameter (identifier) @variable.parameter)

; Functions

(procedure_declaration (identifier) @function (block))

(call_expression function: (identifier) @function.call)

; Types

type: (types) @type
type: (identifier) @type
((types) @type)

modifier: (identifier) @keyword
keyword: (identifier) @keyword

((types (identifier) @type.builtin)
 (#any-of? @type.builtin
 "bool" "int" "string" "void" "float" "float32" "float64"
 "s8" "s16" "s32" "s64"
 "u8" "u16" "u32" "u64"
 "Type" "Any"))

(struct_declaration (identifier) @type ":" ":")

(enum_declaration (identifier) @type ":" ":")

; Fields

(member_expression "." (identifier) @variable.other.member)

(assignment_statement (identifier) @variable.other.member "="?)
(update_statement (identifier) @variable.other.member)

; Constants

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z0-9_]+$"))

(member_expression . "." (identifier) @constant)

(enum_declaration (identifier) @constant)

; Literals

(integer) @constant.numeric.integer
(float) @constant.numeric.float

(string) @string

(escape_sequence) @constant.character.escape

(boolean) @constant.builtin.boolean

[
 (uninitialized)
 (null)
] @constant.builtin

; Operators

[
 ":"
 "="
 "+"
 "-"
 "*"
 "/"
 "%"
 ">"
 ">="
 "<"
 "<="
 "=="
 "!="
 "|"
 "~"
 "&"
 "&~"
 "<<"
 ">>"
 "<<<"
 ">>>"
 "||"
 "&&"
 "!"
 ".."
 "+="
 "-="
 "*="
 "/="
 "%="
 "&="
 "|="
 "^="
 "<<="
 ">>="
 "<<<="
 ">>>="
 "||="
 "&&="
] @operator

; Punctuation

[ "{" "}" ] @punctuation.bracket
[ "(" ")" ] @punctuation.bracket
[ "[" "]" ] @punctuation.bracket

[
 "`"
 "->"
 "."
 ","
 ":"
 ";"
] @punctuation.delimiter

; Comments

[
 (block_comment)
 (comment)
] @comment

; Compiler directives

directive: ("#") @keyword
type: ("type_of") @type

(compiler_directive) @keyword
(heredoc_start) @string
(heredoc_end) @string
(heredoc_body) @string
(note) @string

(ERROR) @error
