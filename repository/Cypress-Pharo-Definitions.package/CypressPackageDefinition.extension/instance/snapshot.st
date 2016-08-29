*Cypress-Pharo-Definitions
snapshot
  | packageInfo definitions map classMap cat platform |
  definitions := OrderedCollection new.
  platform := CypressPlatform current.
  packageInfo := platform packageInforForPackageNamed: self name.
  (Class superclassOrder: packageInfo classes)
    do: [ :cls | 
      definitions add: cls asCypressClassDefinition.
      (cls methodDictionary values sorted: [ :a :b | a selector <= b selector ])
        do: [ :method | 
          cat := platform categoryOfMethod: method.
          (cat at: 1) = $*
            ifFalse: [ definitions add: (platform cypressDefinitionOfMethod: method) ] ].
      (cls class methodDictionary values
        sorted: [ :a :b | a selector <= b selector ])
        do: [ :method | 
          cat := platform categoryOfMethod: method.
          (cat at: 1) = $*
            ifFalse: [ definitions add: (platform cypressDefinitionOfMethod: method) ] ] ].
  classMap := Dictionary new.
  Smalltalk allClasses
    do: [ :each | 
      {each.
      (each class)}
        do: [ :aClass | 
          | defs |
          defs := OrderedCollection new.
          map := Dictionary new.
          aClass organization categories
            do: [ :category | 
              | methods |
              methods := aClass organization listAtCategoryNamed: category.
              (category asLowercase beginsWith: '*' , self name asLowercase)
                ifTrue: [ map at: category put: methods ] ].
          (map keys sorted: [ :a :b | a <= b ])
            do: [ :category | 
              ((map at: category) sorted: [ :a :b | a selector <= b selector ])
                do: [ :method | 
                  defs
                    add:
                      (platform cypressDefinitionOfMethod: (aClass compiledMethodAt: method)) ] ].
          defs notEmpty
            ifTrue: [ classMap at: each put: defs ] ] ].
  (Class superclassOrder: classMap keys)
    do: [ :aClass | definitions addAll: (classMap at: aClass) ].
  ^ CypressSnapshot definitions: definitions