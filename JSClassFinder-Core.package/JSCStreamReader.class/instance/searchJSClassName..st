heuristics
searchJSClassName: dictionary
	"Look for potential class name"

	| d className priorObjType |
	className := ''.
	(dictionary ~= nil) & (dictionary isMemberOf: Dictionary)
	ifTrue:[ "Transcript show: 'OK For searchJSClassName:'; cr."
		d := (dictionary at: #object ifAbsent: nil).
		(d ~= nil)
		ifTrue:[
			[(d at: #object ifAbsent: nil) ~= nil]
			whileTrue:[
				priorObjType := d at: #property ifAbsent: nil.
				(priorObjType ~= nil) 
				ifTrue:[
					((priorObjType at:#name ifAbsent:'') ~= #prototype)
					ifTrue:[
						(className = '')
						ifTrue:[className := (priorObjType at: #name ifAbsent: '').]
						ifFalse:[className := (priorObjType at: #name ifAbsent: ''), '.', className.].
					].
				].
			
				d := d at: #object.
			].
			(className = '')
			ifTrue:[className := d at: #name ifAbsent: ''.]
			ifFalse:[className := (d at: #name ifAbsent: ''), '.', className.].
		]
		ifFalse:[className := (dictionary at: #name ifAbsent: '').].
	].

	"Only return names of classes that were identified before (instantiated before)"
	"(className ~= '')
	ifTrue:[ 
		((jsClasses at: className ifAbsent: nil) = nil)
		ifTrue:[ className := ''. ].
	]."

	^ className.