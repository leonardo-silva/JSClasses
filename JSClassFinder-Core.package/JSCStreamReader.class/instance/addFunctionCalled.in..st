data get/put
addFunctionCalled: functionCalledName in: functionName
	"Add a functionCalledName as one function called by functionName"

	| a d |
	"Check HeuristicH4 to see an example where this comparison is useful"
	(self isFunctionInstanceField: functionCalledName in: functionName)
	ifFalse:[ "Transcript show:'Field added: ',fieldName; cr."
		d := (self getJSFunctions) at: functionName ifAbsent: nil.
		(d = nil) ifTrue:[d := Dictionary new.].
		a := d at: #function_calls ifAbsent: nil.	
		(a = nil)	 ifTrue:[a := OrderedCollection new.].
		a add: functionCalledName.
		
		d at: #function_calls put:a.
		jsFunctions at: functionName put: d.
	].
	