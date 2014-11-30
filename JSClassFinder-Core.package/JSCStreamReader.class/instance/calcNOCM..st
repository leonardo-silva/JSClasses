metrics
calcNOCM: dictionary
	"Calculates de value for metric NOCM (Number of Class Methods) for a given class (inside dictionary)"

	| array NOCM |
	NOCM := 0.
	array := dictionary at:#methods ifAbsent:nil.
	(array ~= nil)
	ifTrue:[ NOCM := (array size). ].
	^NOCM