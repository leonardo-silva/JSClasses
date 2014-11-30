heuristics
searchJSMethodsH3_2: dictionary in: className
	"Receives a dictionary containing part of a JS file, in JSON format, and look for definitions of of methods of className class (H3)"
	| left methodName sParams right expression |
	(dictionary ~= nil) 
	ifTrue:[
		((dictionary at:#type ifAbsent:'') = #ExpressionStatement)
		ifTrue:[expression := dictionary at:#expression ifAbsent:nil.
			(expression ~= nil)
			ifTrue:[left := expression at:#left ifAbsent:nil.
				(left ~= nil)
				ifTrue:[
					"property := (left at:#property ifAbsent:nil).
					(property ~= nil)
					ifTrue:[
						methodName := property at:#name ifAbsent:''."
						methodName := self searchClassNameInstantiation: left.
						(methodName ~= '')
						ifTrue:[right := expression at:#right ifAbsent:nil.
							((right at:#type ifAbsent:'') = #FunctionExpression)
							ifTrue:[
								sParams := self searchJSParams: (right at:#params ifAbsent: nil).
								self addJSMethod: methodName in: className key: #methods params:sParams.
							].
						].
					"]."
				].
			].
		].
	].
