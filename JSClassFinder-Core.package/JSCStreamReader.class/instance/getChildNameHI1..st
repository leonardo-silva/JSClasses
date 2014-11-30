heuristics
getChildNameHI1: dictionary
	"Look for potential child class name using heuristic HI1"

	| childName property |
	childName := ''.  "Transcript show:'getChildNameHI1 BEGINNING'; cr."
	(dictionary ~= nil) 
	ifTrue:[ 
		((dictionary at: #type ifAbsent:'') = #MemberExpression)
		ifTrue:[ 
			property := dictionary at: #property ifAbsent:nil.
			(property ~= nil) 
			ifTrue:[ "Transcript show:'getChildNameHI1 property IS NOT NIL ', (property at:#name ifAbsent:''); cr."
				((property at:#name ifAbsent:'') = #prototype)
				ifTrue:[ 
					childName := (dictionary at: #object ifAbsent: nil) at:#name ifAbsent:''.
				].	
			].
		].
	].	

	^ childName.