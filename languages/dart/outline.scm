(class_definition
  "class" @context
  name: (_) @name) @item

; Top-level functions and abstract/external methods.
((function_signature
  [
    (type_identifier)
    (type_arguments)
    (nullable_type)
    (void_type)
    (function_type)
    (record_type)
    "."
  ]* @context.extra
  name: (_) @name) @item
  (#not-has-parent? @item method_signature))

(method_signature
  "static"? @context.extra
  (function_signature
    [
      (type_identifier)
      (type_arguments)
      (nullable_type)
      (void_type)
      (function_type)
      (record_type)
      "."
    ]* @context.extra
    name: (_) @name) @item)

((getter_signature
  [
    (type_identifier)
    (type_arguments)
    (nullable_type)
    (void_type)
    (function_type)
    (record_type)
    "."
  ]* @context.extra
  "get" @context
  name: (_) @name) @item
  (#not-has-parent? @item method_signature))

(method_signature
  "static"? @context.extra
  (getter_signature
    [
      (type_identifier)
      (type_arguments)
      (nullable_type)
      (void_type)
      (function_type)
      (record_type)
      "."
    ]* @context.extra
    "get" @context
    name: (_) @name) @item)

((setter_signature
  "set" @context
  name: (_) @name) @item
  (#not-has-parent? @item method_signature))

(method_signature
  "static"? @context.extra
  (setter_signature
    "set" @context
    name: (_) @name) @item)

; Fields in classes, extensions, enums and mixins
(declaration
  "static"? @context.extra
  "covariant"? @_modifier
  "late"? @_modifier
  (final_builtin)? @_modifier
  (const_builtin)? @_modifier
  [
    (type_identifier)
    (inferred_type)
    (type_arguments)
    (nullable_type)
    (void_type)
    (function_type)
    (record_type)
    "."
  ]* @context.extra
  (initialized_identifier_list
    (initialized_identifier
      (identifier) @name) @item))

(declaration
  "static"? @context.extra
  "covariant"? @_modifier
  "late"? @_modifier
  (final_builtin)? @_modifier
  (const_builtin)? @_modifier
  [
    (type_identifier)
    (inferred_type)
    (type_arguments)
    (nullable_type)
    (void_type)
    (function_type)
    (record_type)
    "."
  ]* @context.extra
  (static_final_declaration_list
    (static_final_declaration
      (identifier) @name) @item))

; Top-level variables
(program
  (initialized_identifier_list
    (initialized_identifier
      (identifier) @name) @item))

(program
  (static_final_declaration_list
    (static_final_declaration
      (identifier) @name) @item))

(enum_declaration
  "enum" @context
  name: (_) @name) @item

(extension_declaration
  "extension" @context
  name: (_) @name) @item
