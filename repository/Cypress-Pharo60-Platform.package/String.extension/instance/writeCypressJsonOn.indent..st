*Cypress-Pharo60-Platform
writeCypressJsonOn: aStream indent: startIndent
    aStream
        nextPutAll: '"';
        nextPutAll: self withUnixLineEndings urlEncoded;
        nextPutAll: '"'
