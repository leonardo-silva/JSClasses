heuristics
searchClassNameNoPrototypeH1: dictionary
	"Returns the name of the function that represents a class, not a method associated to prototype. Heuristic #1 (H1)"

	| d className property |
	className := ''.
	d := dictionary at: #left ifAbsent: nil.
	[d ~= nil]
	whileTrue:[
		property := d at: #property ifAbsent: nil.
		(property ~= nil) 
		ifTrue:[
			(className = '')
			ifTrue:[className := (property at:#name ifAbsent:'').]
			ifFalse:[className := (property at:#name ifAbsent:''), '.', className.].
		]
		ifFalse:[
			(className = '')
			ifTrue:[className := (d at:#name ifAbsent:'').]
			ifFalse:[className := (d at:#name ifAbsent:''), '.', className.].
		].
	
		d := (d at: #object ifAbsent: nil).
	].

	^ className.
	