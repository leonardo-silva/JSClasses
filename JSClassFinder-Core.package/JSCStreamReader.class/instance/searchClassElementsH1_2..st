heuristics
searchClassElementsH1_2: dictionary
	"Receives a dictionary containing part of the structure of a JS file, in JSON format, and look for constructor methods and fields of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1)."
	| id className  |
	id := (dictionary at:#id ifAbsent:nil).
	className := id at:#name ifAbsent:''.
	"((jsClasses at:className ifAbsent:nil) ~= nil)"
	(className ~= '')
	ifTrue:[
		self setConstructorInfo:dictionary in:className.
		"It is necessary to navigate trough the structure to find fields (i.e. inside if statements)"
		self navigateJSONStructure: (dictionary at:#body ifAbsent:nil) in: className target:#fields.
	].
