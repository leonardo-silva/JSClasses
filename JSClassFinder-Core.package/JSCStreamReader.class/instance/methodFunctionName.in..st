metrics
methodFunctionName: methodShortName in: className
	"Returns the name of the method with className as prefix for prototype methods, or without the prefix for the other methods"

	| dictionary aPrototypeMethods i methodName   |
	methodName := methodShortName.
	dictionary := (self getJSClasses) at:className.
	aPrototypeMethods := dictionary at:#prototype_methods ifAbsent:nil.
	(aPrototypeMethods ~= nil)
	ifTrue:[	i := 0.
		[(aPrototypeMethods size) > i]
		whileTrue:[ i := i + 1.
			((aPrototypeMethods at:i) includesSubstring: (methodShortName,'('))
			ifTrue:[
				methodName := className,'.',methodShortName.
				i := (aPrototypeMethods size). "Ends loop"
			].
		].	
	]. 	

	^methodName