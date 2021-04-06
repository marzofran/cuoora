Class {
	#name : #CuOOraProfileComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraProfileComponent >> renderContentOn: aCanvas [
	aCanvas render: CuOOraHeaderComponent new.
]
