heuristics
searchJSMethodNameH4: dictionary
	"Look for potential methods using heuristic #4"

	| d keyObj methodName right |
	methodName := ''. 
	right := dictionary at: #right ifAbsent: nil.
	(right ~= nil)
	ifTrue:[
		((right at: #type ifAbsent: '') = #FunctionExpression)
		ifTrue:[
			d := dictionary at: #left ifAbsent: nil.
			(d ~= nil) 
			ifTrue:[keyObj := d at: #property ifAbsent: nil.
				(keyObj ~= nil)
				ifTrue:[methodName := keyObj at: #name ifAbsent: ''.].
			].

		].
	].
	^ methodName.