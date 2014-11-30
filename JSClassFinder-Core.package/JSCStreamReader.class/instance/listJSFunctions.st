output
listJSFunctions
	"List all functions identified and put on jsFunctions dictionary"

	| i keys array dictionary dFunctions |
	dFunctions := (self getJSFunctions).
	keys := dFunctions keys. "Returns a Set"

	i := 0. 
	[i < keys size] 
		whileTrue: [i := i + 1. 
			Transcript show: 'FUNCTION: ', (keys at:i); cr.

			dictionary := dFunctions at:(keys at:i) ifAbsent:nil.
			(dictionary ~= nil)
			ifTrue:[
				array := dictionary at:#this_fields ifAbsent:nil.
				(array ~= nil)
				ifTrue:[Transcript show: 'Fields(this): '; cr.
					self printClassElements: array.
				].	
				array := dictionary at:#function_calls ifAbsent:nil.
				(array ~= nil)
				ifTrue:[Transcript show: 'Functions Called: '; cr.
					self printClassElements: array.
				].	
			].	
		].	
