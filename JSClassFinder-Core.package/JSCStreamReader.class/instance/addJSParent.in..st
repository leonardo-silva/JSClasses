data get/put
addJSParent: parentName in: className
	"Add parentName to the instance variable jsClasses"

	| a d |
	d := jsClasses at: className ifAbsent: nil.
	(d = nil) ifTrue:[d := Dictionary new.].
	a := d at: #parents ifAbsent: nil.	
	(a = nil)	 ifTrue:[a := OrderedCollection new.].
	a add: parentName.
	
	d at:#parents put:a.
	jsClasses at: className put: d.	
	