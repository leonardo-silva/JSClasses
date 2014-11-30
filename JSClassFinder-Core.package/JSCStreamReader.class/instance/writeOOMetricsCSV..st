output
writeOOMetricsCSV: fileName
	"List OO metrics for all object oriented elements identified in a CSV format"

	| i keys working dictionary file NOCA NOPA NOCM NOPM functions |
	functions := (self getJSFunctions) keys. "Returns a Set"
	keys := (self getJSClasses) keys. "Returns a Set"

	working :=  FileSystem disk workingDirectory.
	file := (working / ('evaluation\',fileName,'.csv')).
	"Delete file if it already exists"
	(file exists) ifTrue:[ file delete. ].
	"Write CSV"
	file writeStreamDo: [ :stream |	
		stream nextPutAll: 'CLASS-NOF=', (functions size) asString, ';DPT;NOCA;NOPA;NOA;NOCM;NOPM;NOM;LCOM;NOC'; cr.
		i := 0. 
		[i < keys size] 
			whileTrue: [i := i + 1. 
				stream nextPutAll: (keys at:i). "Write class name"	
					
				dictionary := (self getJSClasses) at:(keys at:i).	
				NOCA := self calcNOA: dictionary.
				NOPA := self calcNOPA: dictionary.
				NOCM := self calcNOCM: dictionary.
				NOPM := self calcNOPM: dictionary.	
				stream nextPutAll: ';', (self calcDPT: dictionary) asString. "Writes DPT"
				stream nextPutAll: ';', NOCA asString. "Writes NOCA"
				stream nextPutAll: ';', NOPA asString. "Writes NOPA"
				stream nextPutAll: ';', (NOCA + NOPA) asString. "Writes NOA"
				stream nextPutAll: ';', NOCM asString. "Writes NOCM"
				stream nextPutAll: ';', NOPM asString. "Writes NOPM"
				stream nextPutAll: ';', (NOCM + NOPM) asString. "Writes NOM"
				stream nextPutAll: ';', 0 asString. "Writes LCOM"
				"stream nextPutAll: ';', (self calcLCOM: dictionary in:(keys at:i)) asString. Writes LCOM"
				stream nextPutAll: ';', (self calcNOC: dictionary) asString. "Writes NOC"
				stream nextPutAll: ''; cr. "Line delimiter"
			].
	].

"			dictionary := jsClasses at:(keys at:i).
			array := dictionary at:#parents ifAbsent:nil."
			"10 is the limit for DPT (precaution to avoid any posssible circular inheritance - if it exists)"
"			DPT := 0.
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
"