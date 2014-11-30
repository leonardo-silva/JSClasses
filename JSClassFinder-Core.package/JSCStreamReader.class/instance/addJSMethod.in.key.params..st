data get/put
addJSMethod: methodName in: className key: symbol params: sParams
	"Add sMethod to the instance variable jsClasses"

	| a d |
	(self addJSMethodPreConditionsOk: methodName in: className key: symbol params: sParams)
	ifTrue:[
		d := jsClasses at: className ifAbsent: nil.
		(d = nil) ifTrue:[d := Dictionary new.].
		a := d at:symbol ifAbsent: nil.	
		(a = nil)	 ifTrue:[a := OrderedCollection new.].
		a add: methodName,'(',sParams,')'.
		
		d at:symbol put:a.
		jsClasses at: className put: d.	
			
		self addJSMethodShortName: 	methodName in: className.
	].