metrics
calcNOCA: dictionary
	"Calculates de value for metric NOCA (Number of Class Attributes) for a given class (inside dictionary)"

	| array NOCA |
	NOCA := 0.
	array := dictionary at:#fields ifAbsent:nil.
	(array ~= nil)
	ifTrue:[	NOCA := (array size). ].
	^NOCA