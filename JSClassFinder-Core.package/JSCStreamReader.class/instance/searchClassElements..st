input processing
searchClassElements: allPathChildren
	"Look for class elements (methods, attributes,etc), inside JSON files, given a path (allPathChildren). It searches in all subdirectories."

	| i w item dictionary |
	i := 0.
	[i < allPathChildren size] 
		whileTrue: [i := i + 1. 
						item := allPathChildren at:i.
						(item isFile & (item extension asUppercase = 'JSON')) 
							ifTrue: [item readStreamDo: [ :stream | w := (stream contents)].
										dictionary := (NeoJSONReader fromString: w).
										"Identify any methods and prototype fields on passage 1"
										self navigateJSONStructure: dictionary at:1.
										"Identify class definitions, other fields, constructors and prototype depth tree on passage 2"
										self navigateJSONStructure: dictionary at:2.
									  ]
						].