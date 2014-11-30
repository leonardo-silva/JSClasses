data get/put
addFunctionInstanceField: fieldName in: functionName
	"Add a field to the instance fields of the functionName"

	| a d |
	(fieldName = functionName) "Check HeuristicH3 to see an example where this comparison is useful"
	ifFalse:[
		"Transcript show:'FieldName : ',fieldName; cr.
		Transcript show:'functionName : ',functionName; cr."
		(self isFunctionInstanceField: fieldName in: functionName)
		ifFalse:[ "Transcript show:'Field added: ',fieldName; cr."
			d := (self getJSFunctions) at: functionName ifAbsent: nil.
			(d = nil) ifTrue:[d := Dictionary new.].
			a := d at: #this_fields ifAbsent: nil.	
			(a = nil)	 ifTrue:[a := OrderedCollection new.].
			a add: fieldName.
			
			d at: #this_fields put:a.
			jsFunctions at: functionName put: d.
		].
	].