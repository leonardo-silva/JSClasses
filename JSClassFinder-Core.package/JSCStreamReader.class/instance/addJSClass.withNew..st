data get/put
addJSClass: className withNew: wasInstantiated
	"Add a class to the instance variable jsClasses and mark that its instantiation was found"

	| d  |
	d := jsClasses at: className ifAbsent: nil.
	(d = nil) 
	ifTrue:[ "Transcript show: 'Class added: ', className; cr."
		d := Dictionary new.
		d at: #new put: wasInstantiated.
		
		jsClasses at: className put: d.
	].
