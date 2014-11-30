data get/put
addJSField: fieldName in: className key: symbol
	"Add a field to the instance variable jsClasses"

	| a d |
	"(((self getJSFunctions) at:fieldName ifAbsent: nil) = nil)
	ifTrue:["
		(self addJSFieldPreConditionsOk: fieldName in: className key: symbol)
		ifTrue:[
			d := jsClasses at: className ifAbsent: nil.
			(d = nil) ifTrue:[d := Dictionary new.].
			a := d at: symbol ifAbsent: nil.	
			(a = nil)	 ifTrue:[a := OrderedCollection new.].
			a add: fieldName.
			
			d at:symbol put:a.
			jsClasses at: className put: d.
		].
	"]
	ifFalse:[ Properties that receive functions as values become methods
		self addJSMethod: fieldName in: className key:#methods.
	]."	