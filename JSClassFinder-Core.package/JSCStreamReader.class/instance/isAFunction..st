heuristics
isAFunction: functionName
	"Returns true if the parameter is the name of a function"

	^(((self getJSFunctions) at:functionName ifAbsent:nil) ~= nil)
