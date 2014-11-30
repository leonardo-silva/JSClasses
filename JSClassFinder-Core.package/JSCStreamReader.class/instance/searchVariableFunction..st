heuristics
searchVariableFunction: array
	"Receives a structure (array) containing the structure of a JS file, in JSON format, and look for functions"
	| i id functionName item init |
	(array ~= nil)
	ifTrue:[
		i := 0.
		[i < array size]
		whileTrue:[i := i + 1.
			item := array at:i.
			id := (item at:#id ifAbsent:nil).
			functionName := id at:#name ifAbsent:''.
			init := (item at:#init ifAbsent:nil).
			(init ~= nil)
			ifTrue:[
				((init at:#type ifAbsent:'') = #FunctionExpression)
				ifTrue: [ 
					self addJSFunction: functionName. 
					"Search for functions calls inside functionName"
					self navigateJSONStructure: (init at:#body ifAbsent:nil) in: functionName target:#function_calls.
				].
			].
		].
	].