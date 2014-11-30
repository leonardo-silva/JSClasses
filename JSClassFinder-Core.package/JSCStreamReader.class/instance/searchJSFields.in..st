heuristics
searchJSFields: vector in: className
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for definitions of of classes the were prior identified and saved on jsClasses (class variable)"
	| i item  |
	(vector ~= nil) 
	ifTrue:[
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					(item isMemberOf: Dictionary) & ((item at:#type ifAbsent:'') = #ExpressionStatement)
					ifTrue:[self searchJSFieldExpression: (item at:#expression ifAbsent:nil) in: className.]
					ifFalse:[
						(item isMemberOf: Dictionary) & ((item at:#type ifAbsent:'') = #VariableDeclaration)
						ifTrue:[self searchJSFieldVariable: (item at:#declarations ifAbsent:nil) in: className].
					].
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchJSFields: (vector at:(vector keys at:i) ifAbsent:nil) in: className].
				].
		].
	].