heuristics
searchJSClassH2_2: dictionary
	"Receives a dictionary containing part of the structure of a JS file, in JSON format, and look for definitions according to heuristic #2 (H2)."
	| id className  |
	(dictionary ~= nil) 
	ifTrue:[  "Transcript show:'searchJSClassH2:'; cr."
		((dictionary at:#type ifAbsent:'') = #FunctionDeclaration)
		ifTrue:[id := (dictionary at:#id ifAbsent:nil).
			className := id at:#name ifAbsent:''.
			(className ~= '') "& ((jsClasses at:className ifAbsent:nil) = nil)"
			ifTrue:[ 
				"Look for methods"
				self navigateJSONStructure: (dictionary at:#body ifAbsent:nil) in: className target:#methods.
				((jsClasses at:className ifAbsent:nil) ~= nil)
				ifTrue:[
					self setConstructorInfo:dictionary in:className.
					
					"Look for fields"
					self navigateJSONStructure: (dictionary at:#body ifAbsent:nil) in: className target:#fields.
					"self searchJSFields: (dictionary at:#body ifAbsent:nil) in: className."
				].
			].
		].
	].
