output
listOOMetrics
	"List OO metrics for all classes identified and put on jsClasses dictionary"

	| i keys array dictionary DPT classParent |
	keys := jsClasses keys. "Returns a Set"

	Transcript show: 'Total number of classes: ', (keys size) asString; cr.
	i := 0. 
	[i < keys size] 
		whileTrue: [i := i + 1. 
			Transcript show: 'CLASS: ', (keys at:i).

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
			Transcript show: ', DPT = ', DPT asString.
			
			array := dictionary at:#children ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: ', NOC = ', (array size) asString.].	
			array := dictionary at:#this_fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: ', NOA = ', (array size) asString.].	
			array := dictionary at:#prototype_fields ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: ', NOPA = ', (array size) asString.].	
			array := dictionary at:#methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: ', NOM = ', (array size) asString.].	
			array := dictionary at:#prototype_methods ifAbsent:nil.
			(array ~= nil)
			ifTrue:[Transcript show: ', NOPM = ', (array size) asString.].	
			"LCOM"	
			"Transcript show: ', LCOM = ', (self calcLCOM: dictionary in: (keys at:i)) asString."
				
			Transcript show: ''; cr.	
		].	
