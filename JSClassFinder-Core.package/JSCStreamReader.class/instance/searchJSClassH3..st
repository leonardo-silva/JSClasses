heuristics
searchJSClassH3: vector
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for definitions according to heuristic #3 (H3)."
	| i item id className  |
	(vector ~= nil) & ((vector isMemberOf: Array) | (vector isMemberOf: Dictionary)) 
	ifTrue:[  "Transcript show:'searchJSClassH3:'; cr."
		i := 0. 
		[i < vector size ] 
			whileTrue: [i := i+1. 
				(vector isMemberOf: Array) 
				ifTrue: [item := vector at:i.
					(item isMemberOf: Dictionary)
					ifTrue:[
						((item at:#type ifAbsent:'') = #FunctionDeclaration)
						ifTrue:[id := (item at:#id ifAbsent:nil).
							className := id at:#name ifAbsent:''.
							(className ~= '') "& ((jsClasses at:className ifAbsent:nil) = nil)"
							ifTrue:[ 
								"Look for methods"
								self searchJSMethodsH3: (item at:#body ifAbsent:nil) in: className.
								((jsClasses at:className ifAbsent:nil) ~= nil)
								ifTrue:[
									self setConstructorInfo:item in:className.
									
									"sParams := self searchJSParams: (item at:#params ifAbsent: nil).
									(sParams ~= '') ifTrue:[self addJSMethod: className,'(',sParams,')' in: className.]."
									
									self searchJSFields: (item at:#body ifAbsent:nil) in: className.
								].
							].
						].
					].
				]
				ifFalse:[
					(vector isMemberOf: Dictionary) 
					ifTrue:[self searchJSClassH3: (vector at:(vector keys at:i) ifAbsent:nil)].
				].
			].
	].