Class {
	#name : #NCHBinaryOperations,
	#superclass : #Object,
	#category : #'NCH-Hashing'
}

{ #category : #private }
NCHBinaryOperations class >> leftRotate: aWord by: shift [
	| maskOfShiftBits |
	maskOfShiftBits := (2 raisedTo: 32 - shift) - 1.
	^ ((aWord & maskOfShiftBits) << shift) | (aWord >> (32 - shift))
]

{ #category : #private }
NCHBinaryOperations class >> multiply: aWord by: anotherWord [
	^ ((aWord & 16rFFFF) * anotherWord
		+ (((aWord >> 16) * anotherWord & 16rFFFF) << 16)) & 16rFFFFFFFF
]
