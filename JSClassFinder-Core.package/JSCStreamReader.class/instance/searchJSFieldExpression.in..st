heuristics
searchJSFieldExpression: dictionary in: className
	"Look for any field's definition inside dictionary"

	| key typeThis fieldName right object property |
	(dictionary ~= nil)
	ifTrue:[right := dictionary at:#right ifAbsent:nil.
		(right ~= nil)
		ifTrue:[
			((right at:#type ifAbsent:'') ~= #FunctionExpression)
			ifTrue:[
					key := dictionary at:#left ifAbsent:nil.
					(key ~= nil)
					ifTrue:[object := key at:#object ifAbsent:nil.
						(object ~= nil)
						ifTrue:[ 
							typeThis := object at:#type ifAbsent:''.
							(typeThis = #ThisExpression)
							ifTrue:[property := key at:#property ifAbsent:nil.
								(property ~= nil)
								ifTrue:[
									fieldName := property at:#name ifAbsent:''.
									(fieldName ~= '')
									ifTrue:[
										(self isFieldValueAFunction: right)
										ifTrue:[
											"Properties that receive a function becomes a method"
											self addJSMethod: fieldName in: className key: #methods params:''.
										]
										ifFalse:[	
											self addJSField: fieldName in: className key: #this_fields.
										].	
									].
								].	
							].
						]
						ifFalse:[
							((key at:#type ifAbsent:'') = #Identifier)
							ifTrue:[
								fieldName := key at:#name ifAbsent:''.
								(fieldName ~= '')
								ifTrue:[self addJSField: fieldName in: className key: #fields.]
							].
						].
				].	
			].	
		].	
	].	