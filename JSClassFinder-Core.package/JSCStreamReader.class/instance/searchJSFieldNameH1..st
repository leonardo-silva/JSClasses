heuristics
searchJSFieldNameH1: dictionary
	"Look for potential fields using heuristic #1"

	| d keyObj fieldName right |
	fieldName := ''. 
	right := dictionary at: #right ifAbsent: nil.
	(right ~= nil)
	ifTrue:[
		((right at: #type ifAbsent: '') ~= #FunctionExpression)
		ifTrue:[
			d := dictionary at: #left ifAbsent: nil.
			(d ~= nil) 
			ifTrue:[keyObj := d at: #object ifAbsent: nil. 
				(keyObj ~= nil)
					ifTrue:[keyObj := keyObj at: #property ifAbsent: nil.
						(keyObj ~= nil)
							ifTrue:[
								((keyObj at: #name ifAbsent: '') = 'prototype') 
									ifTrue:[d := d at: #property ifAbsent: nil.
										(d ~= nil)
											ifTrue: [fieldName := d at: #name ifAbsent: ''.].
									].
							].	
					].		
			].

		].
	].
	^ fieldName.