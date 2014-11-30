heuristics
searchJSParams: array
	"Look for names of parameters inside an array"

	| d i sParams comma |
	sParams := ''. comma := ''.
	
	((array ~= nil) & (array isMemberOf: Array))
	ifTrue:[i := 0. 
		[i < array size ] 
		whileTrue: [ i := i + 1. 
			d := array at:i ifAbsent: nil.
			(d ~= nil) ifTrue:[sParams := sParams, comma, (d at:#name ifAbsent: ''). comma := ','.].
		].
	].		
	^ sParams.