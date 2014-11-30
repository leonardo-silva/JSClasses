data get/put
setConstructorInfo: paramsDictionary in: className
	"Sets if a constructor method was found for className"

	| d sParams |
	d := jsClasses at: className ifAbsent: nil.
	(d ~= nil) "Class must be present in jsClasses"
	ifTrue:[
		"d at:#constructor put: true.
		jsClasses at: className put: d.	"

		d := (self getJSFunctions) at: className ifAbsent: nil.
		(d ~= nil) "Class must be present in jsFunctions"
		ifTrue:[
			sParams := self searchJSParams: (paramsDictionary at:#params ifAbsent: nil).
			self addJSConstructor: className,'(',sParams,')' in: className.
		].	
	].
	
	