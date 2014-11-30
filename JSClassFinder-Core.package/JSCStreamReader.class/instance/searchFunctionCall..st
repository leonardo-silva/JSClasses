heuristics
searchFunctionCall: dictionary
	"Look for any function call inside dictionary. It is the basis to calculate the metric RFC."

	| callee functionCalledName type |
	(dictionary ~= nil)
	ifTrue:[ "Transcript show:'Inside searchFunctionCall '; cr."
		type := dictionary at:#type ifAbsent:''. 
		(type = 'CallExpression')
		ifTrue:[ "Transcript show:'Inside CallExpression '; cr."
			callee := dictionary at:#callee ifAbsent:nil.
			(callee ~= nil)
			ifTrue:[ "Transcript show:'Callee exists: '; cr."
				functionCalledName := self searchClassNameInstantiation: callee.
				(functionCalledName ~= '')
				ifTrue:[ 
					self addFunctionCalled: functionCalledName in: lastFunctionAdded.
				].	
			].	
		].	
	].
