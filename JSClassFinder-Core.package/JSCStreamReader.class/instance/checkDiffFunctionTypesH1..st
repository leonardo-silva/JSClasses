heuristics
checkDiffFunctionTypesH1: dictionary
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for different types of functions declarations. It follows heuristic #1 (H1)."
	| type expression right |
	type := (dictionary at:#type ifAbsent:'').
	(type = #FunctionDeclaration)
	ifTrue:[self searchClassElementsH1: dictionary.]
	ifFalse:[
		(type = #ExpressionStatement)
		ifTrue:[expression := (dictionary at:#expression ifAbsent:nil).
			(expression ~= nil)
			ifTrue:[right := expression at:#right ifAbsent:nil.
				(right ~= nil) 
				ifTrue:[
					((right at:#type ifAbsent:'') = #FunctionExpression)
					ifTrue:[self searchExpressionElementsH1: expression.	]
				].		
			].
		]
		ifFalse:[
			(type = #VariableDeclaration)
			ifTrue:[self searchVariableElementsH1: (dictionary at:#declarations).]
		].	
	].
