metrics
calcDPT: dictionary
	"Calculates de value for metric DPT (Depth of Prototype Tree) for a given class (inside dictionary)"

	| array DPT classParent |
	array := dictionary at:#parents ifAbsent:nil.
	"10 is the limit for DPT (precaution to avoid any posssible circular inheritance - if it exists)"
	DPT := 0.
	[(array ~= nil) & (DPT < 10)]
	whileTrue:[DPT := DPT + 1.
		classParent := jsClasses at:(array at:1) ifAbsent:nil.
		(classParent ~= nil)
		ifTrue:[array := classParent at:#parents ifAbsent:nil.]
		ifFalse:[array := nil].
	].	
	^DPT