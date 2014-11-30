data get/put
addJSMethodPreConditionsOk: methodName in: className key: symbol params: sParams
	"Verify if conditions ok to add a method to the instance variable jsClasses"

	| result |
	"result := (self isJSMethod: methodName,'(',sParams,')' in: className key:symbol) not."
	result := (self isJSMethod: methodName in: className key: #methods_short_names) not.
	^result