heuristics
getParentNameHI2: dictionary
	"Look for potential parent class name using heuristic HI2"

	| parentName arguments |
	parentName := ''.
	(dictionary ~= nil) 
	ifTrue:[ 
		(self preConditionsHI2: dictionary)
		ifTrue:[ "Transcript show:'PRE-CONDITIONS HI2 OK '; cr."
			arguments := dictionary at: #arguments ifAbsent: nil.
			(arguments isMemberOf: Array) & (arguments size = 1)
			ifTrue:[parentName := self searchJSClassName: (arguments at:1).].
		].
	].	

	^ parentName.
