input processing
scriptMultipleSystems: fileName
	"Script to execute searchJSONFiles to all systems whose source code paths are written inside fileName."

| workingFile objResult |
workingFile := (fileName asFileReference).
(workingFile isFile)
ifTrue:[
	workingFile readStreamDo: [ :stream | 
		[stream atEnd] whileFalse:[
			currentSystemName := stream nextLine.
			currentSystemPath := stream nextLine.
			
			objResult := self searchJSONFiles: currentSystemPath.
			objResult writeOOMetricsCSV: currentSystemName.
			self initialize. "Initialize instance variables"
			
			Transcript show: 'OK Script finished execution for ',currentSystemName; cr.
		].	
	].
].	

"
c := JSCStreamReader new searchJSONFiles: 'C:\Users\LeoHumberto\Documents\Professor\PhD\Thesis\qualitas.js\Projects\FloraJS\src'.
c listJSClasses.
c listOOMetrics.
c listOOMetricsCSV.

	| working allPathChildren |
	working := (sPath asFileReference).
	allPathChildren := (working allChildren).
	
	i := 0.
	[i < allPathChildren size] 
		whileTrue: [i := i + 1. 
						item := allPathChildren at:i.
						(item isFile & (item extension asUppercase = 'JSON')) 
							ifTrue: [item readStreamDo: [ :stream | w := (stream contents)].
										dictionary := (NeoJSONReader fromString: w)."
										"Identify any methods and prototype fields on passage 1"
										"self navigateJSONStructure: dictionary at:1."
										"Identify class definitions, other fields, constructors and prototype depth tree on passage 2"
										"self navigateJSONStructure: dictionary at:2."
										"Cleaning"
										"self removeClassesWithoutConstructor.
									  ]
						]."