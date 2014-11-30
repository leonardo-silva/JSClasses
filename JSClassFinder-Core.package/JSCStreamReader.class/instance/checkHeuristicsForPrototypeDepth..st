heuristics
checkHeuristicsForPrototypeDepth: dictionary
	"Receives a dictionary containing an expression, in JSON format, and look for inheritance definitions (prototype depths)."
	| expression childName parentName |
	(dictionary isMemberOf: Dictionary)
	ifTrue:[ "Transcript show:'checkHeuristicsForPrototypeDepth: '; cr."
		((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
		ifTrue:[ "Transcript show:'INSIDE ExpressionStatement: '; cr."
			expression := (dictionary at:#expression ifAbsent:nil).
			childName := self getChildNameHI1: (expression at:#left ifAbsent:nil).
			(childName ~= '')
			ifTrue:[ 
				parentName := self getParentNameHI1: (expression at:#right ifAbsent:nil).
				(parentName ~= '')
				ifTrue:[
					self addJSParent: parentName in: childName.
					self addJSChild: childName in: parentName.
				]
				ifFalse:[parentName := self getParentNameHI2: (expression at:#right ifAbsent:nil).
					(parentName ~= '')
					ifTrue:[
						self addJSParent: parentName in: childName.
						self addJSChild: childName in: parentName.
					].
				].
			].
		].
	].
