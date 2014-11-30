testing
testHeuristicH4
	"Tests the identification of OO elements (classes, methods, fields, etc) according to heuristc H4"

	| c keys dict aMethods aFields aParents sConstructor hasNew className |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicH4'. "'C:\Pharo\moose-5.0\JSClasses\JSClassesTests'."
	dict := c getJSClasses.
	keys := (dict keys) asSortedCollection: [ :x :y | x > y]. "Returns an ordered Set"
	self assert: (keys size) = 2.
	"First class"
	className := (keys at:1).
	self assert: className = 'ellipse'.
	aParents := (dict at:className) at:#parents ifAbsent:nil.
	self assert: aParents = nil.
	hasNew := (dict at:className) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:className) at:#this_fields.
	self assert: (aFields size) = 2.
	self assert: (aFields at:1) = 'a'.
	self assert: (aFields at:2) = 'b'.
	sConstructor := (dict at:className) at:#constructor.
	self assert: sConstructor = 'ellipse(a,b)'.	
	aMethods := (dict at:className) at:#prototype_methods ifAbsent:nil.
	self assert: aMethods = nil.
	aMethods := (dict at:className) at:#methods_short_names.
	self assert: (aMethods size) = 2.
	self assert: (aMethods at:1) = 'getArea'.
	self assert: (aMethods at:2) = 'setAxis'.
	"Second class"
	className := (keys at:2).
	self assert: className = 'PIXI.Circle'.
	aParents := (dict at:className) at:#parents ifAbsent:nil.
	self assert: aParents = nil.
	sConstructor := (dict at:className) at:#constructor.
	self assert: sConstructor = 'PIXI.Circle(x,y,radius)'.	
	hasNew := (dict at:className) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:className) at:#this_fields.
	self assert: (aFields size) = 3.
	self assert: (aFields at:1) = 'x'.
	self assert: (aFields at:2) = 'y'.
	self assert: (aFields at:3) = 'radius'.
	aFields := (dict at:className) at:#prototype_fields ifAbsent:nil.
	self assert: aFields = nil.	
	aMethods := (dict at:className) at:#prototype_methods.
	self assert: (aMethods size) = 2.
	self assert: (aMethods at:1) = 'clone()'.
	self assert: (aMethods at:2) = 'contains(x,y)'.
	aMethods := (dict at:className) at:#methods ifAbsent:nil.
	self assert: aMethods = nil.
	"Metrics"
	self assert: (c calcLCOM: (dict at:'PIXI.Circle') in:'PIXI.Circle') = 1.
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 8.
	aFields := (dict at:'PIXI.Circle') at:#this_fields.
	self assert: (aFields at:1) = 'x'.
	
