data get/put
isJSMethod: methodName in: className key: symbol
	"Returns true if methodName exists for the class|symbol inside jsClasses"

	| a d result |
	result := false.
	
	d := jsClasses at: className ifAbsent: nil.
	(d ~= nil) 
	ifTrue:[
		a := d at: symbol ifAbsent: nil.	
		(a ~= nil) 
		ifTrue:[
			result := (a includes: methodName).
		].
	].
	^result
	