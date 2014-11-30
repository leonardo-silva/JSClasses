heuristics
checkExpressionFieldsH1H4: dictionary
	"Receives a structure (dictionary ) containing an expression and look for definitions of fields (attributes) according to heuristic H1"
	| fieldName className left |
	fieldName := ''.
	
	fieldName := self searchJSFieldNameH1: dictionary. 
	(fieldName ~= '') 
	ifTrue:[
		left := dictionary at: #left ifAbsent: nil.
		(left ~= nil) 
		ifTrue:[
			"sClassName := self searchJSClassNameH1: dictionary."
			className := self searchJSClassName: left. 
			(className ~= '')
			ifTrue:[self addJSField: fieldName in: className key: #prototype_fields.]
			ifFalse:[fieldName := ''.].
		].	
	].
"HEURISTIC 4 (H4) below."
"	ifFalse:[
		fieldName := self searchJSFieldNameH4: dictionary. 
		(fieldName ~= '') 
		ifTrue:[
			sClassName := self searchJSClassNameH1: dictionary. 
			(sClassName ~= '')
			ifTrue:[self addJSField: fieldName in: sClassName key: #fields.]
			ifFalse:[fieldName := ''.].
		].	
	]."	
	^ fieldName.