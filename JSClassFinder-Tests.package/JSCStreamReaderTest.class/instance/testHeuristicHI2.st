testing
testHeuristicHI2
	"Tests the identification of OO elements (depth of prototype tree) according to heuristc HI2"

	| c keys dict aMethods aFields aParents sConstructor hasNew className |
	c := JSCStreamReader new searchJSONFiles: sPath,'\HeuristicHI2'. "'C:\Pharo\moose-5.0\JSClasses\JSClassesTests'."
	dict := c getJSClasses.
	keys := dict keys. "Returns a Set"
	self assert: (keys size) = 3.
	"First class"
	className := (keys at:1).
	self assert: className = 'ContextMenu'.
	aParents := (dict at:className) at:#parents ifAbsent:nil.
	self assert: (aParents at:1) = 'Menu'.
	sConstructor := (dict at:className) at:#constructor.
	self assert: sConstructor = 'ContextMenu(id)'.	
	hasNew := (dict at:className) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:className) at:#fields.
	self assert: (aFields size) = 4.
	self assert: (aFields at:1) = '$newMenu'.
	self assert: (aFields at:2) = '$popUp'.
	self assert: (aFields at:3) = '$toggle'.
	self assert: (aFields at:4) = 'self'.
	aFields := (dict at:className) at:#prototype_fields.
	self assert: (aFields at:1) = 'parentClass'.	
	aMethods := (dict at:className) at:#prototype_methods.
	self assert: (aMethods size) = 3.
	self assert: (aMethods at:1) = 'open(mouseOrLocation)'.
	self assert: (aMethods at:2) = 'close()'.
	self assert: (aMethods at:3) = 'isOpen()'.
	aMethods := (dict at:className) at:#methods ifAbsent:nil.
	self assert: aMethods = nil.
	"self assert: (aMethods at:1) = 'assignContextMenuToSelector(selector,cmenu)'."
	"Second class"
	className := (keys at:2).
	self assert: className = 'Menu'.
	aParents := (dict at:className) at:#parents ifAbsent:nil.
	self assert: aParents = nil.
	sConstructor := (dict at:className) at:#constructor.
	self assert: sConstructor = 'Menu(id)'.	
	hasNew := (dict at:className) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:className) at:#this_fields.
	self assert: (aFields at:1) = 'id'.	
	aMethods := (dict at:className) at:#prototype_methods.
	self assert: (aMethods size) = 7.
	self assert: (aMethods at:1) = '_getMenuItemId(commandId)'.
	self assert: (aMethods at:2) = '_getMenuItemForCommand(command)'.
	self assert: (aMethods at:3) = '_getRelativeMenuItem(relativeID,position)'.
	self assert: (aMethods at:4) = 'removeMenuItem(command)'.
	self assert: (aMethods at:5) = 'removeMenuDivider(menuItemID)'.
	self assert: (aMethods at:6) = 'addMenuItem(command,keyBindings,position,relativeID)'.
	self assert: (aMethods at:7) = 'addMenuDivider(position,relativeID)'.
	"Third class"
	className := (keys at:3).
	self assert: className = 'MenuItem'.
	aParents := (dict at:className) at:#parents ifAbsent:nil.
	self assert: aParents = nil.
	hasNew := (dict at:className) at:#new ifAbsent: false.
	self assert: hasNew = true.
	aFields := (dict at:className) at:#this_fields.
	self assert: (aFields size) = 4.
	self assert: (aFields at:1) = 'id'.
	self assert: (aFields at:2) = 'isDivider'.
	self assert: (aFields at:3) = 'isNative'.
	self assert: (aFields at:4) = '_command'.
	sConstructor := (dict at:className) at:#constructor.
	self assert: sConstructor = 'MenuItem(id,command)'.	
	aMethods := (dict at:className) at:#prototype_methods.
	self assert: (aMethods size) = 7.
	self assert: (aMethods at:1) = 'getCommand()'.
	self assert: (aMethods at:2) = 'getParentMenu()'.
	self assert: (aMethods at:3) = '_checkedChanged()'.
	self assert: (aMethods at:4) = '_enabledChanged()'.
	self assert: (aMethods at:5) = '_nameChanged()'.
	self assert: (aMethods at:6) = '_keyBindingAdded(event,keyBinding)'.
	self assert: (aMethods at:7) = '_keyBindingRemoved(event,keyBinding)'.
	"Metrics"
	"self assert: (c calcLCOM: (dict at:'ContextMenu') in:'ContextMenu') = 0.
	self assert: (c calcLCOM: (dict at:'MenuItem') in:'MenuItem') = 19."
	"Functions"
	dict := c getJSFunctions.
	self assert: (dict size) = 37.
	aFields := (dict at:'ContextMenu.isOpen') at:#this_fields.
	self assert: (aFields at:1) = 'id'.
		