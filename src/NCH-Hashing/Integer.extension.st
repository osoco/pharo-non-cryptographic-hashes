Extension { #name : #Integer }

{ #category : #'*NCH-Hashing' }
Integer >> ->-> shiftAmount [
	"rotate right shift"

	^ self bitRightRotationShift: shiftAmount
]

{ #category : #'*NCH-Hashing' }
Integer >> <-<- shiftAmount [
	"rotate left shift"

	^ self bitLeftRotationShift: shiftAmount
]

{ #category : #'*NCH-Hashing' }
Integer >> bitLeftRotationShift: shiftCount [
    ^ NCHBinaryOperations leftRotate: self by: shiftCount  
]

{ #category : #'*NCH-Hashing' }
Integer >> bitRightRotationShift: shiftCount [
    ^ NCHBinaryOperations rightRotate: self by: shiftCount  
]
