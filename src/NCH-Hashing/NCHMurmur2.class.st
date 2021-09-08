Class {
	#name : #NCHMurmur2,
	#superclass : #Object,
	#instVars : [
		'seed'
	],
	#category : #'NCH-Hashing'
}

{ #category : #'instance creation' }
NCHMurmur2 class >> withSeed: anInteger [ 
	^ self new 
	   seed: anInteger;   
	   yourself
]

{ #category : #'public - hashing' }
NCHMurmur2 >> hash: aByteArray [
	| words h remainingWord |

	words := self thirtyTwoBitsWordsFrom: aByteArray.
	h := seed bitXor: aByteArray size.
	1 to:words size do:[ :i| 
			| mixedWord |
			mixedWord := self mixWord: (words at:i).
			h := ((NCHBinaryOperations multiply: h by: self m) bitXor: mixedWord) & 16rFFFFFFFF .
			 ].

	remainingWord := (self remainingWordFrom: aByteArray) asInteger.
	remainingWord > 16rFFFF ifTrue:[ h := h bitXor:(remainingWord & 16rFF0000) ].
	remainingWord > 16rFF ifTrue:[ h := h bitXor:(remainingWord & 16rFF00) ]. 
	remainingWord > 0 ifTrue:[ 
			h := h bitXor: (remainingWord & 16rFF) & 16rFFFFFFFF.
			h := (NCHBinaryOperations multiply: h by: self m) ].

	h := (h bitXor: ((h  & 16rFFFFFFFF) >> 13)) & 16rFFFFFFFF.
	h := (NCHBinaryOperations multiply: h by: self m).
	h := (h bitXor: ((h  & 16rFFFFFFFF) >> 15)) & 16rFFFFFFFF.
	
	^ h
]

{ #category : #'as yet unclassified' }
NCHMurmur2 >> m [
	^  16r5bd1e995  
]

{ #category : #private }
NCHMurmur2 >> mixWord: aThirtyTwoBitsWord [

	|  mixedWord  |

	mixedWord := NCHBinaryOperations multiply: aThirtyTwoBitsWord asInteger by: self m.
	mixedWord := (mixedWord bitXor:((mixedWord & 16rFFFFFFFF) >>  self r) & 16rFFFFFFFF ).
	^ NCHBinaryOperations multiply: mixedWord by: self m.
]

{ #category : #'as yet unclassified' }
NCHMurmur2 >> r [
	^  24  
]

{ #category : #private }
NCHMurmur2 >> remainingWordFrom: aByteArray [

	| numberOfRemainingBytes remainingWord offsetRemainingBytes remainingByteArray |
	numberOfRemainingBytes := aByteArray size % 4.
	offsetRemainingBytes := aByteArray size - numberOfRemainingBytes.
	remainingByteArray := ByteArray new: 4.
	numberOfRemainingBytes > 0 ifTrue: [ 
			0 to: numberOfRemainingBytes - 1 do: [ :index | 
		remainingByteArray
			byteAt: 4 - index
			put: (aByteArray at: offsetRemainingBytes + index + 1) ]. ].

	remainingWord := ThirtyTwoBitRegister new
		loadFrom: remainingByteArray
		at: 1.
	^ remainingWord
]

{ #category : #'public - accessing' }
NCHMurmur2 >> seed: anInteger [ 
	seed := anInteger 
]

{ #category : #private }
NCHMurmur2 >> thirtyTwoBitsWordsFrom: aByteArray [
	| words |
	words := OrderedCollection new.
	aByteArray
		doWithIndex: [ :e :index | 
			index % 4 = 0
				ifTrue: [ words
						add:
							(ByteArray
								with: (aByteArray at: index)
								with: (aByteArray at: index - 1)
								with: (aByteArray at: index - 2)
								with: (aByteArray at: index - 3)) ] ].
	^ words
]
