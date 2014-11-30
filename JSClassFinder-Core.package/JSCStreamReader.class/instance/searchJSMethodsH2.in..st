heuristics
searchJSMethodsH2: vector in: className
	"Receives a structure (dictionary or array) containing part of a JS file, in JSON format, and look for definitions of of methods of className class"
	| i item id methodName sParams |
	(vector ~= nil) 
	ifTrue:[
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					(item isMemberOf: Dictionary) & ((item at:#type ifAbsent:'') = #FunctionDeclaration)
					ifTrue:[id := (item at:#id ifAbsent:nil).
						methodName := id at:#name ifAbsent:''.
						(methodName ~= '')
						ifTrue:[
							sParams := self searchJSParams: (item at:#params ifAbsent: nil).
							self addJSMethod: methodName,'(',sParams,')' in: className key: #methods.
						].
					].
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchJSMethodsH2: (vector at:(vector keys at:i) ifAbsent:nil) in: className].
				].
		].
	].