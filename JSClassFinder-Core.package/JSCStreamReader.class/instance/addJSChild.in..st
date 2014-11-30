data get/put
addJSChild: childName in: className
	"Add a relationship childName->Parent(className) inside jsClasses"

	| a d |
	d := jsClasses at: className ifAbsent: nil.
	(d = nil) ifTrue:[d := Dictionary new.].
	a := d at: #children ifAbsent: nil.	
	(a = nil)	 ifTrue:[a := OrderedCollection new.].
	a add: childName.
	
	d at:#children put:a.
	jsClasses at: className put: d.	
	