Class {
	#name : #BaselineOfNonCryptographicHashes,
	#superclass : #BaselineOf,
	#category : #BaselineOfNonCryptographicHashes
}

{ #category : #baselines }
BaselineOfNonCryptographicHashes >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self specPackages: spec.
			self specGroups: spec ]
]

{ #category : #specs }
BaselineOfNonCryptographicHashes >> specGroups: spec [
	spec group: 'Core' with: #('NCH-Hashing').
	spec group: 'Tests' with: #('NCH-Hashing-Tests').
	spec group: 'All' with: #('Core' 'Tests').
	spec group: 'default' with: #('All')
]

{ #category : #specs }
BaselineOfNonCryptographicHashes >> specPackages: spec [
	spec
		package: 'NCH-Hashing';
		package: 'NCH-Hashing-Tests' with: [ spec requires: 'NCH-Hashing' ]
]
