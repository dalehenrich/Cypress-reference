testing
testPrintString
  | name pkg |
  name := 'Cypress-Mocks'.
  pkg := CypressPackageDefinition new name: name.
  self assert: 'aCypressPackageDefinition(' , name , ')' equals: pkg printString