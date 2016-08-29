instance creation
fromJson: aJsonString

	^self fromJs: (CypressPlatform current parseJSON: aJsonString)
