heuristics
searchJSPrototypeDepth: vector
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for inheritance definitions, according to heuristics HI1 e HI2."
	| i item |
	(vector ~= nil) 
	ifTrue:[  
		(vector isMemberOf: Array)
		ifTrue:[
			i := 0. 
			[ i < vector size ] 
			whileTrue: [i := i+1. 
				item := vector at:i.
				((item at:#type ifAbsent:'') = #ExpressionStatement)
				ifTrue: [self checkHeuristicsForPrototypeDepth: item.].
				self searchJSPrototypeDepth: item.
			].
		]
		ifFalse:[
			(vector isMemberOf: Dictionary) 
			ifTrue:[
				i := 0. 
				[ i < vector keys size ] 
				whileTrue: [i := i+1. 
					item := (vector at:(vector keys at:i) ifAbsent:nil).
					(item isMemberOf: Dictionary)
					ifTrue:[	
						((item at:#type ifAbsent:'') = #ExpressionStatement)
						ifTrue:[	self checkHeuristicsForPrototypeDepth: item.].
					].		
					self searchJSPrototypeDepth: item.
				].
			].
		].
	].

"	| i item |
	(vector ~= nil) & ((vector isMemberOf: Array) | (vector isMemberOf: Dictionary))  
	ifTrue:[
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					self checkHeuristicsForPrototypeDepth: item.
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchJSPrototypeDepth: (vector at:(vector keys at:i) ifAbsent:nil)].
				].
			].
	].
"

"	| i item |
	(vector ~= nil) 
	ifTrue:[  
		(vector isMemberOf: Array)
		ifTrue:[
			i := 0. 
			[ i < vector size ] 
			whileTrue: [i := i+1. 
				item := vector at:i.
				self checkHeuristicsForPrototypeDepth: item.
				self searchJSPrototypeDepth: item.
			].
		]
		ifFalse:[
			(vector isMemberOf: Dictionary) 
			ifTrue:[
				i := 0. 
				[ i < vector keys size ] 
				whileTrue: [i := i+1. 
					item := (vector at:(vector keys at:i) ifAbsent:nil).
					self checkHeuristicsForPrototypeDepth: item.
					self searchJSPrototypeDepth: (vector at:(vector keys at:i) ifAbsent:nil).
				].
			].
		].
	].
"