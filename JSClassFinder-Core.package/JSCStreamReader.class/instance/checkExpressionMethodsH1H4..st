heuristics
checkExpressionMethodsH1H4: dictionary
	"Receives a structure (dictionary ) containing an expression and look for definitions of methods according to heuristics H1 and H4"
	| methodName className sParams left symbol |
	methodName := self searchJSMethodNameH1: dictionary. 
	(methodName = '') 
	ifTrue:[symbol := #methods.
			"methodName := self searchJSMethodNameH4: dictionary. "
	]
	ifFalse:[symbol := #prototype_methods.].
		
	(methodName ~= '') 
	ifTrue:[
		left := dictionary at:#left ifAbsent: nil.
		(left ~= nil)
		ifTrue:[
			className := self searchJSClassName: left. 
			(className ~= '')
			ifTrue:[ 
				sParams := self searchJSParams: ((dictionary at:#right ifAbsent: nil)at:#params ifAbsent: nil).
				self addJSMethod: methodName in: className key: symbol params: sParams.
				"self addJSMethod: methodName,'(',sParams,')' in: className key: symbol."
			]
			ifFalse:[methodName := ''].
		]
		ifFalse:[methodName := ''].
	].	

	^ methodName.

"	sMethodName := self searchJSMethodNameH1: dictionary. 
	(sMethodName ~= '') 
	ifTrue:[
		sClassName := self searchJSClassNameH1: dictionary. 
		(sClassName ~= '')
		ifTrue:[
			sParams := self searchJSParams: ((dictionary at:#right ifAbsent: nil)at:#params ifAbsent: nil).
			self addJSMethod: sMethodName,'(',sParams,')' in: sClassName key: #prototype_methods.
		]
		ifFalse:[sMethodName := ''].
	]
	ifFalse:[
		sMethodName := self searchJSMethodNameH4: dictionary. 
		(sMethodName ~= '') 
		ifTrue:[
			sClassName := self searchJSClassNameH1: dictionary. 
			(sClassName ~= '')
			ifTrue:[
				sParams := self searchJSParams: ((dictionary at:#right ifAbsent: nil)at:#params ifAbsent: nil).
				self addJSMethod: sMethodName,'(',sParams,')' in: sClassName key: #methods.
			]
			ifFalse:[sMethodName := ''].
		].	
	].	"	