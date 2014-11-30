metrics
calcNOPA: dictionary
	"Calculates de value for metric NOPA (Number of Prototype Attributes) for a given class (inside dictionary)"

	| array NOPA |
	NOPA := 0.
	array := dictionary at:#prototype_fields ifAbsent:nil.
	(array ~= nil)
	ifTrue:[ NOPA := (array size). ].
	^NOPA