Class {
	#name : #ConfigurationOfNonCryptographicHashes,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfNonCryptographicHashes
}

{ #category : #'development support' }
ConfigurationOfNonCryptographicHashes class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfNonCryptographicHashes class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfNonCryptographicHashes class >> catalogContactInfo [
	^ 'pharo-non-cryptographic-hashes is written and supported by Rafael Luque, Javier Luque and other developers at OSOCO.'
]

{ #category : #catalog }
ConfigurationOfNonCryptographicHashes class >> catalogDescription [
	^ 'Collection of non-cryptographic hash functions for Pharo Smalltalk.

It includes the following hash functions:

  - MurmurHash3 32-bits x86 variant.
  - MurmurHash3 128-bits x64 variant.


More info in the GitHub repository: https://github.com/osoco/pharo-non-cryptographic-hashes'
]

{ #category : #catalog }
ConfigurationOfNonCryptographicHashes class >> catalogKeywords [
	^ #(hash non_cryptographic murmur)
]

{ #category : #private }
ConfigurationOfNonCryptographicHashes class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfNonCryptographicHashes class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfNonCryptographicHashes class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfNonCryptographicHashes class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfNonCryptographicHashes class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfNonCryptographicHashes class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfNonCryptographicHashes class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfNonCryptographicHashes class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfNonCryptographicHashes >> baseline1x: spec [
	<version: '1.x-baseline'>
	spec
		for: #common
		do: [ self projectDescription: spec.
			spec
				baseline: 'NonCryptographicHashes'
				with: [ spec repository: 'github://osoco/pharo-non-cryptographic-hashes:master/src' ] ]
]

{ #category : #accessing }
ConfigurationOfNonCryptographicHashes >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfNonCryptographicHashes >> development: spec [
	<symbolicVersion: #development>
	spec for: #common version: '1.x-baseline'
]

{ #category : #accessing }
ConfigurationOfNonCryptographicHashes >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'as yet unclassified' }
ConfigurationOfNonCryptographicHashes >> projectDescription: aSpec [
aSpec
				blessing: #stable;
				author: 'Rafael Luque, Javier Luque, and other OSOCO developers';
				description: 'Non-cryptographic hashes for Pharo'.
]

{ #category : #'symbolic versions' }
ConfigurationOfNonCryptographicHashes >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0.0'.

]

{ #category : #versions }
ConfigurationOfNonCryptographicHashes >> version100: spec [
	<version: '1.0.0'>
	spec
		for: #common
		do: [ 
			self projectDescription: spec.
			spec
				baseline: 'NonCryptographicHashes'
				with: [ spec
						repository: 'github://osoco/pharo-non-cryptographic-hashes:v1.0.0/src' ] ]
]
