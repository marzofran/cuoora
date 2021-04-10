Class {
	#name : #Respuesta,
	#superclass : #Participacion,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #construction }
Respuesta class >> conDescripcion: unaDescripcion conUsuario: unUsuario [ 
	^ (self conDescripcion: unaDescripcion)
	initializeConUsuario: unUsuario
]

{ #category : #queries }
Respuesta >> esDeUsuario: unUsuario [
	^ usuario == unUsuario
]

{ #category : #initialization }
Respuesta >> initializeConUsuario: unUsuario [
	usuario := unUsuario 
]

{ #category : #queries }
Respuesta >> puntos [
	^ 50
]

{ #category : #accessing }
Respuesta >> usuario [

	^ usuario
]
