output
listOOMetricsCSV
	"List OO metrics for all object oriented elements identified in a CSV format"

	| i keys array dictionary DPT classParent NOCA NOPA NOCM NOPM |
	keys := jsClasses keys. "Returns a Set"

	"Transcript show: 'Total number of classes: ', (keys size) asString; cr."
	Transcript show: 'CLASS;DPT;NOCA;NOPA;NOA;NOCM;NOPM;NOM'; cr.
	i := 0. 
	[i < keys size] 
		whileTrue: [i := i + 1. 
			Transcript show: (keys at:i).

			dictionary := jsClasses at:(keys at:i).
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
			Transcript show: ';', DPT asString.

			NOCA := 0. NOPA := 0. NOCM := 0. NOPM := 0.			
			array := dictionary at:#fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[	NOCA := (array size). ].
			Transcript show: ';', NOCA asString.
			array := dictionary at:#prototype_fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[ NOPA := (array size). ].
			Transcript show: ';', NOPA asString.
			Transcript show: ';', (NOCA+NOPA) asString.
			array := dictionary at:#methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[ NOCM := (array size). ].
			Transcript show: ';', NOCM asString.
			array := dictionary at:#prototype_methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[ NOPM := (array size). ].
			Transcript show: ';', NOPM asString.
			Transcript show: ';', (NOCM+NOPM) asString.
				
			Transcript show: ''; cr.	
		].	
