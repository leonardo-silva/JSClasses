heuristics
searchClassNameInstantiation: dictionary
	"Look for potential class name used during the instantiation of the class"

	| d className priorObjType priorObjTypeName |
	className := ''.
	(dictionary ~= nil) & (dictionary isMemberOf: Dictionary)
	ifTrue:[ "Transcript show: 'OK For searchJSClassName:'; cr."
		d := dictionary.
		[(d at: #object ifAbsent: nil) ~= nil]
		whileTrue:[
			priorObjType := d at: #property ifAbsent: nil.
			(priorObjType ~= nil) 
			ifTrue:[ priorObjTypeName := (priorObjType at:#name ifAbsent:'').
				(priorObjTypeName ~= #prototype) & (priorObjTypeName ~= '')
				ifTrue:[
					(className = '')
					ifTrue:[className := priorObjTypeName.]
					ifFalse:[className := priorObjTypeName, '.', className.	].
				].
			].
			
			d := d at: #object.
		].
		(className = '') 
		ifTrue:[className := d at: #name ifAbsent: ''.]
		ifFalse:[
			((d at: #name ifAbsent: '') ~= '')
			ifTrue:[	className := (d at: #name ifAbsent: ''), '.', className.]. 
		].
	].

	^ className.