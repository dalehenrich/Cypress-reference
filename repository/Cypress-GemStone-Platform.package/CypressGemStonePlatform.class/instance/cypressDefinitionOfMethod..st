method portability
cypressDefinitionOfMethod: aMethod
  | methodClass |
  methodClass := self methodClassOfMethod: aMethod.
  ^ CypressMethodDefinition
    className: methodClass theNonMetaClass name asString
    classIsMeta: methodClass isMeta
    selector: aMethod selector asString
    category: (self categoryOfMethod: aMethod)
    source: (self sourceOfMethod: aMethod)