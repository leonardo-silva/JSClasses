testing
testHeuristicHI1
	"Tests the identification of classes according to heuristc HI1"

	| c keys dict aMethods aFields aParents sConstructor hasNew |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicHI1'. "'C:\Pharo\moose-5.0\JSClassesTests'."
	dict := c getJSClasses.
	keys := dict keys. "Returns a Set"
	"Child class"
	self assert: (keys at:1) = 'Cat'.
	aParents := (dict at:(keys at:1)) at:#parents.
	self assert: (aParents at:1) = 'Mammal'.
	hasNew := (dict at:(keys at:1)) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:(keys at:1)) at:#this_fields.
	self assert: (aFields at:1) = 'name'.
	self assert: (aFields at:2) = 'saying'.
	sConstructor := (dict at:(keys at:1)) at:#constructor.
	self assert: sConstructor = 'Cat(name)'.	
	aMethods := (dict at:(keys at:1)) at:#prototype_methods.
	self assert: (aMethods at:1) = 'get_name()'.
	"Parent class"
	self assert: (keys at:2) = 'Mammal'.
	hasNew := (dict at:(keys at:2)) at:#new ifAbsent: false.
	self assert: hasNew = true.
	"Metrics"
	self assert: (c calcLCOM: (dict at:'Mammal') in:'Mammal') = 0.
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 5.
	aFields := (dict at:'Mammal') at:#this_fields.
	self assert: (aFields at:1) = 'name'.
		