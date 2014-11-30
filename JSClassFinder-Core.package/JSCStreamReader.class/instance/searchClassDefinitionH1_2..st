heuristics
searchClassDefinitionH1_2: dictionary
	"Receives a dictionary containing part of the structure of a JS file, in JSON format, and look for definitions of classes that were prior identified and saved on jsClasses (class variable). It follows heuristic #1 (H1)."
	(dictionary ~= nil) & (jsClasses keys size > 0) 
	ifTrue:[
		self checkDiffFunctionTypesH1: dictionary.
	]. 
