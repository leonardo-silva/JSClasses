data get/put
addJSMethodShortName: methodName in: className
	"Add names of methods, without parameters information, to the instance variable jsClasses"

	| a d |
	d := jsClasses at: className ifAbsent: nil.
	(d = nil) ifTrue:[d := Dictionary new.].
	a := d at:#methods_short_names ifAbsent: nil.	
	(a = nil)	 ifTrue:[a := OrderedCollection new.].
	a add: methodName.
	
	d at:#methods_short_names put:a.
	jsClasses at: className put: d.	
	