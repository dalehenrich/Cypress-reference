*Cypress-Pharo-Platform
writeCypressJsonOn: aStream indent: startIndent
    aStream
        nextPutAll: '"';
        nextPutAll: self withUnixLineEndings urlEncoded;
        nextPutAll: '"'