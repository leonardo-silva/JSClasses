heuristics
searchJSClassH1: vector
	"Receives a structure (dictionary or array) containing the structure of a JS file, in JSON format, and look for definitions of classes according to heuristic #1 (H1)"
	| i key keyType sMethodName sFieldName |
	i := 0. key := nil. sMethodName := ''. sFieldName := ''.

	[i < vector size ] 
		whileTrue: [i := i+1. 
			(vector isMemberOf: Array) 
				ifTrue: [key := vector at:i.].
			(vector isMemberOf: Dictionary) 
				ifTrue:[key := vector at:(vector keys at:i). 
					keyType := (vector keys at:i).

					(keyType = #expression) 
						ifTrue: [
							sMethodName := self checkExpressionMethodsH1H4: key. 
							(sMethodName = '')
							ifTrue:[sFieldName := self checkExpressionFieldsH1H4: key.].
						].
				].
			((key isMemberOf: Dictionary) | (key isMemberOf: Array)) & (sMethodName = '') & (sFieldName = '')
				ifTrue: [self searchJSClassH1: key].  "Recursive call"
		].