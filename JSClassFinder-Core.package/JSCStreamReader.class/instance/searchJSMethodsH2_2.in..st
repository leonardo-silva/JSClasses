heuristics
searchJSMethodsH2_2: dictionary in: className
	"Receives a dictionary containing part of a JS file, in JSON format, and look for definitions of of methods of className class following heuristic H2"
	| id methodName sParams |
	(dictionary ~= nil) 
	ifTrue:[
		((dictionary at:#type ifAbsent:'') = #FunctionDeclaration)
		ifTrue:[id := (dictionary at:#id ifAbsent:nil).
			methodName := id at:#name ifAbsent:''.
			(methodName ~= '')
			ifTrue:[
				sParams := self searchJSParams: (dictionary at:#params ifAbsent: nil).
				self addJSMethod: methodName in: className key: #methods params: sParams.
			].
		].
	].
