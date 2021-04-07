Class {
	#name : #CuOOraProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #construction }
CuOOraProfileComponent class >> conUsuario: unUsuario [
	^ self new initializeConUsuario: unUsuario
]

{ #category : #initialization }
CuOOraProfileComponent >> initializeConUsuario: unUsuario [
	usuario := unUsuario
]

{ #category : #rendering }
CuOOraProfileComponent >> renderContentOn: aCanvas [
	aCanvas render: CuOOraHeaderComponent new.
	aCanvas heading with: 'Preguntas de ' , usuario nombre.
]
