Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'fechaYHora',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #construction }
Interaccion class >> conUsuario: unUsuario [
	^ self new initializeConUsuario: unUsuario
]

{ #category : #queries }
Interaccion >> esDeUsuario: unUsuario [
	^ usuario = unUsuario
]

{ #category : #initialization }
Interaccion >> initialize [
	fechaYHora := DateAndTime now.
]

{ #category : #initialization }
Interaccion >> initializeConUsuario: unUsuario [
	usuario := unUsuario 
]
