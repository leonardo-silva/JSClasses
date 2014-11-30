heuristics
isPrototypeMethod: dictionary
	"Returns True if the function is a method associated to prototype. Heuristic #1 (H1)"

	| d result property |
	result := false.
	d := dictionary at: #left ifAbsent: nil.
	(d ~= nil) 
	ifTrue:[
		[((d at: #object ifAbsent: nil) ~= nil) & (result = false)]
		whileTrue:[
			property := d at: #property ifAbsent: nil.
			(property ~= nil) & ((property at:#name ifAbsent:'') = #prototype)
			ifTrue:[result := true.]
			ifFalse:[d := d at: #object.].
		].
	].

	^ result.