heuristics
isFieldValueAFunction: dictionary
	"Returns true if the value found in the dictionary corresponds to a function"

	| fieldValue result |
	result := false.
	(dictionary ~= nil)
	ifTrue:[
		fieldValue := self searchClassNameInstantiation: dictionary.
		(fieldValue ~= '')
		ifTrue:[ "Transcript show:'Field value: ', fieldValue; cr."
			(self isAFunction: fieldValue)
			ifTrue:[ result := true.	].	
		].			
	].	
	^result