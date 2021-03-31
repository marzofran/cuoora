Class {
	#name : #CuOOraLoginComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraLoginComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'
]

{ #category : #updating }
CuOOraLoginComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
		
		'.
]
