heuristics
searchExpressionElementsH1_2: dictionary
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for elements (fields and constructor methods) of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1) for functions created as expressions."
	| right className expression |
	expression := (dictionary at:#expression ifAbsent:nil).
	(expression ~= nil)
	ifTrue:[right := expression at:#right ifAbsent:nil.
		(right ~= nil) 
		ifTrue:[
			((right at:#type ifAbsent:'') = #FunctionExpression)
			ifTrue:[
				(self isPrototypeMethod: expression)
				ifFalse:[
					className := self searchClassNameNoPrototypeH1: expression. "Transcript show: 'NAME:', className; cr."
					((jsClasses at:className ifAbsent:nil) ~= nil)
					ifTrue:[
						"right := (dictionary at:#right ifAbsent:nil).
						(right ~= nil)
						ifTrue:["
							self setConstructorInfo:right in:className.
							"It is necessary to navigate trough the structure to find fields (i.e. inside if statements)"
							self navigateJSONStructure:(right at:#body ifAbsent:nil) in:className target:#fields.
						"]."
					].
				].
			].
		].		
	].
