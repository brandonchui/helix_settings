(procedure_declaration (block) @function.inside) @function.around

(struct_declaration (struct_or_union (struct_or_union_block) @class.inside)) @class.around

(enum_declaration) @class.around

(named_parameters
	parameters: ((parameter) @parameter.inside . ","? @parameter.around) @parameter.around)

(assignment_parameters
	argument: ((_) @parameter.inside . ","? @parameter.around) @parameter.around)

(comment) @comment.inside

(comment)+ @comment.around
