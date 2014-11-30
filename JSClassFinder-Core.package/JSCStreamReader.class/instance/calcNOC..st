metrics
calcNOC: dictionary
	"Calculates de value for metric NOC (Number of Children) for a given class (inside dictionary)"

	| array NOC |
	NOC := 0.
	array := dictionary at:#children ifAbsent:nil.
	(array ~= nil)
	ifTrue:[	NOC := (array size). ].
	^NOC