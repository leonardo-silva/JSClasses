input processing
callHeuristics2: dictionary at:passage
	"Calls functions responsible for running the heuristics to identify OO elements"
	| needToGoDeeper |
	needToGoDeeper := true.
	
	(passage = 1)
	ifTrue:[
		((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
		ifTrue:[ "Transcript show:'Heuristic #1: Prototype lambda'; cr."
			"Heuristic #1: Prototype lambda"
	 	   self searchJSClassH1_2: dictionary.
		].
	]
	ifFalse:[
		(passage = 2)
		ifTrue:[
			"Heuristic #1: Prototype lambda"
			((dictionary at:#type ifAbsent:'') = #FunctionDeclaration)
			ifTrue:[ 
				self searchClassElementsH1_2: dictionary.
				"Heuristic #2: Inner method"
			   self searchJSClassH2_2: dictionary.
				needToGoDeeper := false.
			]
			ifFalse:[
				((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
				ifTrue:[ 
					self searchExpressionElementsH1_2: dictionary.
					"Heuristics HI1 e HI2 for inheritance"
					self checkHeuristicsForPrototypeDepth: dictionary.
				]
				ifFalse:[ 
					((dictionary at:#type ifAbsent:'') = #VariableDeclaration)
					ifTrue:[ 
						self searchVariableElementsH1_2: (dictionary at:#declarations).
					].
				].
			].
		].	
	].
	^needToGoDeeper	
