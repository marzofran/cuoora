Class {
	#name : #CuOOraSession,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
CuOOraSession >> usuario [
	^ usuario
]

{ #category : #accessing }
CuOOraSession >> usuario: anObject [
	usuario := anObject
]
