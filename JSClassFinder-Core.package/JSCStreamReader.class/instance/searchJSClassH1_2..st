heuristics
searchJSClassH1_2: dictionary
	"Receives a dictionary part of the structure of a JS file, in JSON format, and look for definitions of classes according to heuristic #1 (H1)"
	| expression methodName fieldName |
	methodName := ''. fieldName := ''.

	expression := dictionary at:#expression ifAbsent:nil.
	(expression ~= nil) 
	ifTrue: [ "Transcript show:'CHAMOU!!!'; cr."
		methodName := self checkExpressionMethodsH1H4: expression. 
		(methodName = '')
		ifTrue:[fieldName := self checkExpressionFieldsH1H4: expression.].
	].
