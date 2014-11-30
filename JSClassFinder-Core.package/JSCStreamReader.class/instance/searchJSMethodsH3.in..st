heuristics
searchJSMethodsH3: vector in: className
	"Receives a structure (dictionary or array) containing part of a JS file, in JSON format, and look for definitions of of methods of className class (H3)"
	| i item left methodName sParams right expression |
	(vector ~= nil) 
	ifTrue:[
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 						"Transcript show:'searchJSMethodsH3:'."
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					(item isMemberOf: Dictionary) & ((item at:#type ifAbsent:'') = #ExpressionStatement)
					ifTrue:[expression := item at:#expression ifAbsent:nil.
						(expression ~= nil)
						ifTrue:[left := expression at:#left ifAbsent:nil.
							(left ~= nil)
							ifTrue:[
								"property := (left at:#property ifAbsent:nil).
								(property ~= nil)
								ifTrue:["
									"methodName := property at:#name ifAbsent:''."
									methodName := self searchClassNameInstantiation: left.
									(methodName ~= '')
									ifTrue:[right := expression at:#right ifAbsent:nil.
										((right at:#type ifAbsent:'') = #FunctionExpression)
										ifTrue:[sParams := self searchJSParams: (right at:#params ifAbsent: nil).
											self addJSMethod: methodName,'(',sParams,')' in: className key: #methods.
										].
									].
								"]."
							].
						].
					].
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchJSMethodsH3: (vector at:(vector keys at:i) ifAbsent:nil) in: className].
				].
		].
	].