metrics
calcNOA: dictionary
	"Calculates de value for metric NOA (Number of Attributes) for a given class (inside dictionary). It consider only instance fields, declared with the keyword 'this'"

	| array NOA |
	NOA := 0.
	array := dictionary at:#this_fields ifAbsent:nil.
	(array ~= nil)
	ifTrue:[	NOA := (array size). ].
	^NOA