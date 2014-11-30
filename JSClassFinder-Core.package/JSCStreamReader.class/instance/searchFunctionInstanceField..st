heuristics
searchFunctionInstanceField: dictionary
	"Look for any field's declaration, with 'this', inside dictionary. At this point it is not possible to determine if the field corresponds to a method or not."

	| typeThis fieldName property object |
	(dictionary ~= nil)
	ifTrue:[ "Transcript show:'Inside searchFunctionInstanceField: '; cr."
		object := dictionary at:#object ifAbsent:nil.
		(object ~= nil)
		ifTrue:[
			typeThis := object at:#type ifAbsent:''.
			(typeThis = #ThisExpression)
			ifTrue:[ 
				property := dictionary at:#property ifAbsent:nil.
				(property ~= nil)
				ifTrue:[
					fieldName := property at:#name ifAbsent:''.
					(fieldName ~= '')
					ifTrue:[
						self addFunctionInstanceField: fieldName in: lastFunctionAdded.
					].	
				].
			].	
		].	
	].
