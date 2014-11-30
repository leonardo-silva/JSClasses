output
printClassElements: array
	"Send the elements of the array to the Transcript (separated by commas)"

	| j |
	j := 0.
	[j < array size] 
		whileTrue: [j := j + 1.
			Transcript show: '     ', (array at:j); cr.
		].
