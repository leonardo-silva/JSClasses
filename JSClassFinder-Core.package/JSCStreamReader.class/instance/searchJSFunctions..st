heuristics
searchJSFunctions: dictionary
	"Look for all functions signature inside the source code"

	| id functionName expression right |
	((dictionary at:#type ifAbsent:'') = #FunctionDeclaration)
	ifTrue:[ 
		id := (dictionary at:#id ifAbsent:nil).
		functionName := id at:#name ifAbsent:''.
		(functionName ~= '')
		ifTrue:[
			self addJSFunction: functionName.
			"Search for functions calls inside functionName"
			self navigateJSONStructure: (dictionary at:#body ifAbsent:nil) in: functionName target:#function_calls.
		].
	]
	ifFalse:[
		((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
		ifTrue:[ 
			expression := (dictionary at:#expression ifAbsent:nil).
			(expression ~= nil)
			ifTrue:[right := expression at:#right ifAbsent:nil.
				(right ~= nil) 
				ifTrue:[
					((right at:#type ifAbsent:'') = #FunctionExpression)
					ifTrue:[
						functionName := self searchClassNameInstantiation: (expression at:#left ifAbsent:nil). 
						"Transcript show: 'NAME:', functionName; cr."
						(functionName ~= '')
						ifTrue:[
							self addJSFunction: functionName.
							"Search for functions calls inside functionName"
							self navigateJSONStructure: (right at:#body ifAbsent:nil) in: functionName target:#function_calls.
						].
					].
				].	
			].	
		]
		ifFalse:[
			((dictionary at:#type ifAbsent:'') = #VariableDeclaration)
			ifTrue:[ 
				self searchVariableFunction: (dictionary at:#declarations).
			].
		].
	].	


"	| type className arguments needToGoDeeper |
	className := ''. 
	needToGoDeeper := true.
	type := dictionary at: #type ifAbsent: ''.
	(type = 'NewExpression') 
	ifTrue:[ needToGoDeeper := false.
		className := self searchClassNameInstantiation: (dictionary at: #callee ifAbsent: nil).
		(className ~= '') & ((jsClasses at: className ifAbsent: nil) = nil)
		ifTrue:[	self addJSClass: className. ].
	]
	ifFalse:[
		(self preConditionsHI2: dictionary)
		ifTrue:[ needToGoDeeper := false.
			arguments := (dictionary at: #arguments ifAbsent: nil).
			(arguments ~= nil)
			ifTrue:[ 
				className := self searchClassNameInstantiation: ((arguments at:1) at:#object ifAbsent: nil).
				(className ~= '') & ((jsClasses at: className ifAbsent: nil) = nil)
				ifTrue:[	self addJSClass: className. ].
			].		
		].
	].	
	^needToGoDeeper"