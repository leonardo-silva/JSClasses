data get/put
addJSMethod: sMethod in: className key: symbol
	"Add sMethod to the instance variable jsClasses"

	| a d |
	d := jsClasses at: className ifAbsent: nil.
	(d = nil) ifTrue:[d := Dictionary new.].
	a := d at:symbol ifAbsent: nil.	
	(a = nil)	 ifTrue:[a := OrderedCollection new.].
	a add: sMethod.
	
	d at:symbol put:a.
	jsClasses at: className put: d.	
	