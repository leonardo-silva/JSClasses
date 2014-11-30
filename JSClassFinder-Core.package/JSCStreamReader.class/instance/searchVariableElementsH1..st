heuristics
searchVariableElementsH1: array
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for elements (fields and constructor methods) of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic H1."
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

					"sParams := self searchJSParams: (init at:#params ifAbsent: nil).
					(sParams ~= '') ifTrue:[self addJSMethod: className,'(',sParams,')' in: className.]."

					self searchJSFields: (init at:#body ifAbsent:nil) in: className.
				].
			].
		].
	].