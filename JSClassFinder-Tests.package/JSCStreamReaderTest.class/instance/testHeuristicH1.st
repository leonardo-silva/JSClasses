testing
testHeuristicH1
	"Tests the identification of classes according to heuristc#1"

	| c keys dict aMethods aFields sConstructor hasNew |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicH1'. "'C:\Pharo\moose-5.0\JSClassesTests'."
	dict := c getJSClasses.
	keys := dict keys. "Returns a Set"
	self assert: (keys at:1) = 'circle'.
	hasNew := (dict at:(keys at:1)) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:(keys at:1)) at:#this_fields.
	self assert: (aFields at:1) = 'radius'.
	aMethods := (dict at:(keys at:1)) at:#prototype_methods.
	self assert: (aMethods size) = 3.
	self assert: (aMethods at:1) = 'getArea()'.
	self assert: (aMethods at:2) = 'getCircumference()'.	
	self assert: (aMethods at:3) = 'setRadius(radius)'.	
	sConstructor := (dict at:(keys at:1)) at:#constructor ifAbsent:''.
	self assert: sConstructor = 'circle(radius)'.
	"Metrics"
	self assert: (c calcLCOM: (dict at:'circle') in:'circle') = 3.
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 4.
	aFields := (dict at:'circle') at:#this_fields.
	self assert: (aFields at:1) = 'radius'.
					