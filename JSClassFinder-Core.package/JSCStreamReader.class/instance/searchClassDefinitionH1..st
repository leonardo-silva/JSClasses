heuristics
searchClassDefinitionH1: vector
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for definitions of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1)."
	| i item |
	(vector ~= nil) & (jsClasses keys size > 0) & ((vector isMemberOf: Array) | (vector isMemberOf: Dictionary))
	ifTrue:[
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					(item isMemberOf: Dictionary) 
					ifTrue:[
						self checkDiffFunctionTypesH1: item.
						self searchClassDefinitionH1: item.  "Recursive call to keep looking"
					]. 
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchClassDefinitionH1: (vector at:(vector keys at:i) ifAbsent:nil)].
				].
		].
	].
