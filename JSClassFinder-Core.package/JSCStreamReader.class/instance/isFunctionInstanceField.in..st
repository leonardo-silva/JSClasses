data get/put
isFunctionInstanceField: fieldName in: functionName
	"Returns true if fieldName already exists for the class|symbol inside jsFunctions"

	| a d result |
	result := false.
	
	d := (self getJSFunctions) at: functionName ifAbsent: nil.
	(d ~= nil) 
	ifTrue:[
		a := d at: #this_fields ifAbsent: nil.	
		(a ~= nil) 
		ifTrue:[
			result := (a includes: fieldName).
		].
	].
	^result
	