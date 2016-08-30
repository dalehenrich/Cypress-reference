tests
testChunkFormatFileout

	| name pkg struct writer result |
	name := 'Cypress-Mocks'.
	pkg := CypressPackageDefinition named: name.
	struct := CypressPackageStructure fromPackage: pkg.
	writer := CypressSmalltalkFileoutWriter new
					packageStructure: struct;
					yourself.
	result := String streamContents: [:stream | writer fileOutPackageOn: stream].
	self assert: result equals: self chunkFormatMocks.