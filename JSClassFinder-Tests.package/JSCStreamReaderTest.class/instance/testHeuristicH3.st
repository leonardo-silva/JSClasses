testing
testHeuristicH3
	"Tests the identification of classes according to heuristc#3"

	| c keys dict aMethods aFields sConstructor hasNew |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicH3'. "'C:\Pharo\moose-5.0\JSClassesTests'."
	dict := c getJSClasses.
	keys := dict keys. "Returns a Set"
	self assert: (keys at:1) = 'triangle'.
	hasNew := (dict at:(keys at:1)) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:(keys at:1)) at:#this_fields.
	self assert: (aFields at:1) = 'base'.
	aFields := (dict at:(keys at:1)) at:#fields.
	self assert: (aFields at:1) = 'height'.
	aMethods := (dict at:(keys at:1)) at:#methods.
	self assert: (aMethods at:1) = 'getArea()'.
	self assert: (aMethods at:2) = 'getHeight()'.	
	self assert: (aMethods at:3) = 'getBase()'.	
	self assert: (aMethods at:4) = 'setBase(base)'.	
	sConstructor := (dict at:(keys at:1)) at:#constructor.	
	self assert: sConstructor = 'triangle(base)'.	
	"Metrics"
	self assert: (c calcLCOM: (dict at:'triangle') in:'triangle') = 0.
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 5.
	aFields := (dict at:'setBase') at:#this_fields.
	self assert: (aFields at:1) = 'base'.
