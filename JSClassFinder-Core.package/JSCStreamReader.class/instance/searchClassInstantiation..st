heuristics
searchClassInstantiation: dictionary
	"Look for instantiations of classes inside the source code"

	| type className arguments needToGoDeeper |
	className := ''. 
	needToGoDeeper := true.
	type := dictionary at: #type ifAbsent: ''.
	(type = 'NewExpression') 
	ifTrue:[ needToGoDeeper := false.
		className := self searchClassNameInstantiation: (dictionary at: #callee ifAbsent: nil).
		(className ~= '') & ((jsClasses at: className ifAbsent: nil) = nil)
		ifTrue:[	self addJSClass: className withNew: true. ].
	]
	ifFalse:[
		(self preConditionsHI2: dictionary)
		ifTrue:[ needToGoDeeper := false.
			arguments := (dictionary at: #arguments ifAbsent: nil).
			(arguments ~= nil)
			ifTrue:[ "arguments is an array"
				className := self searchClassNameInstantiation: ((arguments at:1) at:#object ifAbsent: nil).
				(className ~= '') & ((jsClasses at: className ifAbsent: nil) = nil)
				ifTrue:[	self addJSClass: className withNew: true. ].
			].		
		].
	].	
	^needToGoDeeper