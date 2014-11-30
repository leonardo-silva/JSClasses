data get/put
removeClassesWithoutConstructor
	"Removes information about potencial classes that, eventually, are not considered classes because they do not have constructor methods or because they are not instantiated"

	| i keys dictionary sConstructor hasNew |
	keys := jsClasses keys. "Returns a Set"

	i := 0. 
	[i < keys size] 
		whileTrue: [i := i + 1. 
			dictionary := jsClasses at:(keys at:i).
			(dictionary = nil)
			ifTrue:[ 
				jsClasses removeKey:(keys at:i).
			]
			ifFalse:[	 "Classes that have no constructor are eliminated"				
				sConstructor := dictionary at:#constructor ifAbsent:''.
				(sConstructor = '')
				ifTrue:[ 	jsClasses removeKey:(keys at:i).	]
				ifFalse:[	 "Classes not instantiated are eliminated"		
					hasNew := dictionary at: #new ifAbsent: false.
					(hasNew)
					ifFalse:[ jsClasses removeKey:(keys at:i). ].
				].			
			].	
		].	

					"Classes that have no methods nor attributes nor prototype methods, and are not instantiated with new/Object.create(), are eliminated"				
					"array := dictionary at:#methods ifAbsent: nil.	
					(array = nil)
					ifTrue:["
						"array := dictionary at:#prototype_methods ifAbsent: nil.	
						(array = nil)
						ifTrue:[
							array := dictionary at:#this_fields ifAbsent: nil.
							(array = nil)
							ifTrue:[						
								array := dictionary at:#prototype_fields ifAbsent: nil.		
								(array = nil)
								ifTrue:[ jsClasses removeKey:(keys at:i).
								].			
							].
						]."			
					"]."			
