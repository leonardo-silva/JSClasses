data get/put
addJSConstructor: sMethod in: sClassName
	"Add a constructor method to the instance variable jsClasses"

	| d |
	d := jsClasses at: sClassName ifAbsent: nil.
	(d ~= nil) ifTrue:[
		d at:#constructor put: sMethod.
		jsClasses at: sClassName put: d.	
	].
