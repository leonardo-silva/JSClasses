data get/put
addJSFieldPreConditionsOk: fieldName in: className key: symbol
	"Add a field to the instance variable jsClasses"

	| result |
	result := true.
	( (self isJSField: fieldName in: className key:symbol) | ((symbol = #fields) & (self isJSField: fieldName in: className key:#prototype_fields)) )
	ifTrue:[ result := false. ]
	ifFalse:[
		(symbol = #prototype_fields) & (fieldName = 'constructor')
		ifTrue:[ result := false. ]
		ifFalse:[ 
			(self isJSMethod: fieldName in: className key: #methods_short_names)
			ifTrue:[ result := false. ]
		].
	].
	^result