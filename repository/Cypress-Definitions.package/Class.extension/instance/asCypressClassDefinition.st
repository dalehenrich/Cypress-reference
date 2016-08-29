*Cypress-Definitions
asCypressClassDefinition
  ^ CypressClassDefinition
    name: self name asString
    superclassName: self superclass name asString
    category: self category
    instVarNames: (self instVarNames collect: [ :each | each asString ])
    classInstVarNames:
      (self class instVarNames collect: [ :each | each asString ])
    comment: self comment