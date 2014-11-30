heuristics
searchJSFieldVariable: array in: className
	"Look for any field's definition inside array"

	| dictionary key fieldName i |
	(array ~= nil)
	ifTrue:[i := 0.
		[i < array size]
		whileTrue:[i := i + 1.
			dictionary := array at:i ifAbsent:nil.
			(dictionary ~= nil) & (dictionary isMemberOf: Dictionary)
			ifTrue:[key := (dictionary at:'id' ifAbsent:nil).
				(key ~= nil) 
				ifTrue:[fieldName := key at:'name' ifAbsent:''.
					(fieldName ~= '')
					ifTrue:[self addJSField: fieldName in: className key: #fields].
				].	
			].	
		].	
			
	].	