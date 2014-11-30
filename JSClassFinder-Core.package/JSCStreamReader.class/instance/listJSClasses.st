output
listJSClasses
	"List all classes and methods identified and put on jsClasses dictionary"

	| i keys array dictionary sConstructor hasNew |
	keys := jsClasses keys. "Returns a Set"

	i := 0. 
	[i < keys size] 
		whileTrue: [i := i + 1. 
			Transcript show: 'CLASS: ', (keys at:i); cr.

			dictionary := jsClasses at:(keys at:i).
			array := dictionary at:#parents ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Parents: '; cr.
				self printClassElements: array.
			].	
			array := dictionary at:#children ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Children: '; cr.
				self printClassElements: array.
			].	
			hasNew := dictionary at:#new ifAbsent: false.
			(hasNew)
			ifTrue:[Transcript show: 'Has NEW: YES'; cr.]	
			ifFalse:[Transcript show: 'Has NEW: NO'; cr.]	.
			sConstructor := dictionary at:#constructor ifAbsent:''.
			(sConstructor ~= '')
			ifTrue:[Transcript show: 'Constructor: '; cr.
				Transcript show: '    ', sConstructor; cr.
			].	
				
			array := dictionary at:#this_fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Fields: '; cr.
				self printClassElements: array.
			].	
			array := dictionary at:#prototype_fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Prototype Fields: '; cr.
				self printClassElements: array.
			].	
			array := dictionary at:#methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Methods: '; cr.
				self printClassElements: array.
			].	
			array := dictionary at:#prototype_methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: 'Prototype Methods: '; cr.
				self printClassElements: array.
			].	
		].	
