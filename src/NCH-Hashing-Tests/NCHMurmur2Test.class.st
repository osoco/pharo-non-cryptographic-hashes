Class {
	#name : #NCHMurmur2Test,
	#superclass : #TestCase,
	#category : #'NCH-Hashing-Tests'
}

{ #category : #tests }
NCHMurmur2Test >> testMurmur2WithOne32BitBlock [
	| hasher output |
	hasher := NCHMurmur2 withSeed: 0.
	output := hasher hash: 'k' asByteArray.
	self assert: output  equals: 3288208012
]

{ #category : #tests }
NCHMurmur2Test >> testMurmur2WithSeveral32BitBlocks [
	| hasher output |
	hasher := NCHMurmur2 withSeed: 0.
	output := hasher hash: 'The quick brown fox jumps over the lazy dog' asByteArray.
	self assert: output equals: 556214736
]

{ #category : #tests }
NCHMurmur2Test >> testMurmur2WithSeveral32BitBlocks2 [
	| hasher output |
	hasher := NCHMurmur2 withSeed: 0.
	output := hasher hash: 
	('No man is an island,
Entire of itself,' withLineEndings: String lf) asByteArray.
	self assert: output equals: 527766222
]
