heuristics
searchJSFields_2: dictionary in: className
	"Receives a dictionary containing part of the structure of a JS file, in JSON format, and look for definitions of fields for classes that were prior identified and saved on jsClasses (class variable)"
	(dictionary ~= nil) 
	ifTrue:[
		((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
		ifTrue:[self searchJSFieldExpression: (dictionary at:#expression ifAbsent:nil) in: className.]
		ifFalse:[
			((dictionary at:#type ifAbsent:'') = #VariableDeclaration)
			ifTrue:[self searchJSFieldVariable: (dictionary at:#declarations ifAbsent:nil) in: className].
		].
	].
