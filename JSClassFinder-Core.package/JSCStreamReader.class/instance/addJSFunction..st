data get/put
addJSFunction: functionName
	"Add info about functions inside jsFunctions"

	| d |
	d := jsFunctions at: functionName ifAbsent: nil.
	(d = nil) 
	ifTrue:[ "Transcript show: 'Function added: ', functionName; cr."
		jsFunctions at: functionName put: (Dictionary new).
		"Keeps track of the last function added to be able to save the fields accessed for each method"
		lastFunctionAdded := functionName.
	].
