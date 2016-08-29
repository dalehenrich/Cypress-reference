testing
testClassDefinition
  | def x |
  def := CypressClassDefinition
    name: 'Foo'
    superclassName: 'Object'
    category: 'Foo'
    instVarNames: #()
    classInstVarNames: #()
    comment: ''.
  self assert: (x := def printString) = 'a CypressClassDefinition (Foo)'