heuristics
preConditionsHI2: dictionary
	"Verifies if the dictionary contains the elements necessary to apply heuristic HI2"

	| result callee object property  |
	result := false.
	(dictionary ~= nil) 
	ifTrue:[ 
		((dictionary at: #type ifAbsent:'') = #CallExpression)
		ifTrue:[
			callee := dictionary at: #callee ifAbsent: nil.
			(callee ~= nil)
			ifTrue:[
				object := callee at: #object ifAbsent: nil.
				(object ~= nil)
				ifTrue:[
					((object at: #name ifAbsent:'') = 'Object')
					ifTrue:[
						property := callee at: #property ifAbsent: nil.
						((property at: #name ifAbsent:'') = 'create')
						ifTrue:[result := true.].
					].	
				].	
			].	
		].
	].	

	^ result.
