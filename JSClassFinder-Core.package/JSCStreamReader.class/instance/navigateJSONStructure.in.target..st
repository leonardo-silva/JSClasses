input processing
navigateJSONStructure: vector in:className target:target_type
	"Navigates through JSON structure calling functions that look for elements of className"
	| i item key |
	(vector ~= nil) 
	ifTrue:[  
		(vector isMemberOf: Array)
		ifTrue:[
			i := 0. 
			[ i < vector size ] 
			whileTrue: [i := i+1. 
				item := vector at:i.
				self navigateJSONStructure: item in:className target:target_type.
			].
		]
		ifFalse:[
			(vector isMemberOf: Dictionary) 
			ifTrue:[
				(target_type = #fields)
				ifTrue:[	self searchJSFields_2: vector in: className.]
				ifFalse:[ 
					(target_type = #methods)
					ifTrue:["Consider method only if it is prototype (H1) or associated to a field with this (H3)"
						"self searchJSMethodsH2_2: vector in: className."
						self searchJSMethodsH3_2: vector in: className.
					]
					ifFalse:[ self searchFunctionCall: vector. ].	
				].
			
				"It is not necessary to navigate deeper if you are looking for fields and find a function"
				(target_type ~= #fields) | ( ((vector at:#type ifAbsent:'') ~= #FunctionDeclaration) & ((vector at:#type ifAbsent:'') ~= #FunctionExpression) )
				ifTrue:[
					i := 0. 
					[ i < vector keys size ] 
					whileTrue: [i := i+1. 
						key := (vector keys at:i).
						(target_type = #function_calls) | (key ~= #arguments)
						ifTrue:[	item := vector at:key.
							(item isMemberOf: Dictionary) | (item isMemberOf: Array)
							ifTrue:[	self navigateJSONStructure: item in:className target:target_type. ].
						].		
					].
				].
			].
		].
	].
