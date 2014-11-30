input processing
navigateJSONStructure: vector at:passage
	"Navigates through JSON structure calling functions that look for specific heuristics"
	| i item needToGoDeeper |
	(vector ~= nil) 
	ifTrue:[  
		(vector isMemberOf: Array)
		ifTrue:[
			i := 0. 
			[ i < vector size ] 
			whileTrue: [i := i+1. 
				item := vector at:i.
				self navigateJSONStructure: item at:passage.
			].
		]
		ifFalse:[
			(vector isMemberOf: Dictionary) 
			ifTrue:[ 
				(passage = 0)
				ifTrue:[ 
					self searchJSFunctions: vector.
					self searchFunctionInstanceField: vector.
					"self searchFunctionCall: vector."
					self searchClassInstantiation: vector.
					"needToGoDeeper := (self searchClassInstantiation: vector). "
					needToGoDeeper := true.
				]
				ifFalse:[ needToGoDeeper := (self callHeuristics2: vector at:passage) ].
				(needToGoDeeper)
				ifTrue:[
					i := 0. 
					[ i < vector keys size ] 
					whileTrue: [i := i+1. 
						item := vector at:(vector keys at:i).
						(item isMemberOf: Dictionary) | (item isMemberOf: Array)
						ifTrue:[	self navigateJSONStructure: item at:passage. ].
					].
				].
			].
		].
	].
