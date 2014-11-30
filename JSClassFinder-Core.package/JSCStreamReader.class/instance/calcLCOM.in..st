metrics
calcLCOM: dictionary in: className
	"Calculates de value for metric LCOM (Lack of Cohesion in Methods) for a given class (inside dictionary). It consider only instance fields, declared with the keyword 'this'"

	| aAllMethods P Q LCOM i j fj dFunctions fieldsMi fieldsMj foundCommonField methodName |
	P := 0. Q := 0. dFunctions := self getJSFunctions.
	aAllMethods := dictionary at:#methods_short_names ifAbsent:nil.
	(aAllMethods ~= nil)
	ifTrue:[	i := 0.
		[(aAllMethods size) > i]
		whileTrue:[ i := i + 1.
			"methodName := self methodFunctionName: (aAllMethods at:i) in: className."
			methodName := className,'.',(aAllMethods at:i).
			((dFunctions at:methodName ifAbsent:nil) = nil)
			ifTrue:[methodName := (aAllMethods at:i).].

			fieldsMi := (dFunctions at:methodName) at: #this_fields ifAbsent:nil.
			j := i.
			[(aAllMethods size) > j]
			whileTrue:[ j := j + 1.
				fj := 0. foundCommonField := false.
				(fieldsMi ~= nil)
				ifTrue:[
					"methodName := self methodFunctionName: (aAllMethods at:j) in: className."
					methodName := className,'.',(aAllMethods at:j).
					((dFunctions at:methodName ifAbsent:nil) = nil)
					ifTrue:[methodName := (aAllMethods at:j).].

					fieldsMj := (dFunctions at:methodName) at: #this_fields ifAbsent:nil.
					(fieldsMj ~= nil)
					ifTrue:[
						[((fieldsMj size) > fj) & (foundCommonField not)]
						whileTrue:[ fj := fj + 1.
							(fieldsMi includes: (fieldsMj at:fj))
							ifTrue:[	foundCommonField := true. ].	
						].	
					].	
				].	
				(foundCommonField) 
				ifTrue:[ P := P + 1. ] 
				ifFalse:[ Q := Q + 1. ].
			].	
		].	
	].

	LCOM := P - Q.
	(LCOM < 0) ifTrue:[LCOM := 0].	
	^LCOM