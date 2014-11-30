testing
testHeuristicH2
	"Tests the identification of classes according to heuristc#2"

	| c keys dict aMethods aFields sConstructor hasNew |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicH2'. "'C:\Pharo\moose-5.0\JSClassesTests'."
	dict := c getJSClasses.
	keys := dict keys. "Returns a Set"
	self assert: (keys size) = 1.
	self assert: (keys at:1) = 'rectangle'.
	hasNew := (dict at:(keys at:1)) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:(keys at:1)) at:#this_fields.
	self assert: (aFields at:1) = 'side1'.
	self assert: (aFields at:2) = 'side2'.
	"self assert: (aFields at:3) = 'getArea'.
	self assert: (aFields at:4) = 'getTeste'."
	aMethods := (dict at:(keys at:1)) at:#methods.
	self assert: (aMethods at:1) = 'getArea()'.
	self assert: (aMethods at:2) = 'getTeste()'.	
	sConstructor := (dict at:(keys at:1)) at:#constructor.	
	self assert: sConstructor = 'rectangle(side1,side2)'.	
	"Metrics"
	self assert: (c calcLCOM: (dict at:'rectangle') in:'rectangle') = 1.
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 3.
	aFields := (dict at:'getTeste') at:#this_fields.
	self assert: (aFields at:1) = 'side1'.
