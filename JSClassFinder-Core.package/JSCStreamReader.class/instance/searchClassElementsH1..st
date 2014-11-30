heuristics
searchClassElementsH1: dictionary
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for elements (fields and constructor methods) of of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1)."
	| id className  |
	id := (dictionary at:#id ifAbsent:nil).
	className := id at:#name ifAbsent:''.
	((jsClasses at:className ifAbsent:nil) ~= nil)
	ifTrue:[
		self setConstructorInfo:dictionary in:className.
		
		"sParams := self searchJSParams: (dictionary at:#params ifAbsent: nil).
		(sParams ~= '') ifTrue:[self addJSMethod: className,'(',sParams,')' in: className.]."

		self searchJSFields: (dictionary at:#body ifAbsent:nil) in: className.
	].
