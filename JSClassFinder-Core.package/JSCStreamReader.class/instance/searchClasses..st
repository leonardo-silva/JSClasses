input processing
searchClasses: allPathChildren
	"List for classes inside JSON files given a path (allPathChildren). It searches for the use of 'new' or 'Object.create' to instantiate classes."

	| i item w dictionary |
	i := 0.
	[i < allPathChildren size] 
		whileTrue: [i := i + 1. 
						item := allPathChildren at:i.
						(item isFile & (item extension asUppercase = 'JSON')) 
							ifTrue: [item readStreamDo: [ :stream | w := (stream contents)].
										dictionary := (NeoJSONReader fromString: w).
										"Identify classes on passage 0"
										self navigateJSONStructure: dictionary at:0.
									  ]
						].