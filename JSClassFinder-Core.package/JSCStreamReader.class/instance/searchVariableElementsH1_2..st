heuristics
searchVariableElementsH1_2: array
	"Receives a structure (array) containing the structure of a JS file, in JSON format, and look for elements (fields and constructor methods) of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic H1 for variables (use of var)."
	| i id className  item init |
	(array ~= nil)
	ifTrue:[
		i := 0.
		[i < array size]
		whileTrue:[i := i + 1.
			item := array at:i.
			id := (item at:#id ifAbsent:nil).
			className := id at:#name ifAbsent:''.
			((jsClasses at:className ifAbsent:nil) ~= nil)
			ifTrue:[
				init := (item at:#init ifAbsent:nil).
				(init ~= nil)
				ifTrue:[
					self setConstructorInfo:init in:className.
					"It is necessary to navigate trough the structure to find fields (i.e. inside if statements)"
					self navigateJSONStructure: (init at:#body ifAbsent:nil) in:className target:#fields.
					"self searchJSFields: (init at:#body ifAbsent:nil) in: className."
				].
			].
		].
	].