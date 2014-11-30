heuristics
getParentNameHI1: dictionary
	"Look for potential parent class name using heuristic HI1"

	| parentName |
	parentName := ''.
	(dictionary ~= nil) 
	ifTrue:[
		((dictionary at: #type ifAbsent:'') = #NewExpression)
		ifTrue:[
			parentName := (dictionary at: #callee ifAbsent: nil) at:#name ifAbsent:''.
		].
	].	

	^ parentName.