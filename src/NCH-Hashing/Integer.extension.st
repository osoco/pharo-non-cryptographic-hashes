Extension { #name : #Integer }

{ #category : #'*NCH-Hashing' }
Integer >> <-<- shiftAmount [
	"rotate left shift"

	^ self bitRotationShift: shiftAmount
]

{ #category : #'*NCH-Hashing' }
Integer >> bitRotationShift: shiftCount [
    ^ NCHBinaryOperations leftRotate: self by: shiftCount  
]
