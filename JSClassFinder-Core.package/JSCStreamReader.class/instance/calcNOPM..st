metrics
calcNOPM: dictionary
	"Calculates de value for metric NOPA (Number of Prototype Methods) for a given class (inside dictionary)"

	| array NOPM |
	NOPM := 0.
	array := dictionary at:#prototype_methods ifAbsent:nil.
	(array ~= nil)
	ifTrue:[ NOPM := (array size). ].
	^NOPM