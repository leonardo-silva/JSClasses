heuristics
searchExpressionElementsH1: dictionary
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for elements (fields and constructor methods) of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1) for functions created as expressions."
	| right className  |
	(self isPrototypeMethod: dictionary)
	ifFalse:[
		className := self searchClassNameNoPrototypeH1: dictionary. "Transcript show: 'NAME:', className; cr."
		((jsClasses at:className ifAbsent:nil) ~= nil)
		ifTrue:[
			right := (dictionary at:#right ifAbsent:nil).
			(right ~= nil)
			ifTrue:[
				self setConstructorInfo:right in:className.

				"sParams := self searchJSParams: (right at:#params ifAbsent: nil).
				(sParams ~= '') ifTrue:[self addJSMethod: className,'(',sParams,')' in: className.]."

				self searchJSFields: (right at:#body ifAbsent:nil) in: className.
			].
		].
	].
