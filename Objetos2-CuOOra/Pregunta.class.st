Class {
	#name : #Pregunta,
	#superclass : #Participacion,
	#instVars : [
		'titulo',
		'respuestas',
		'topicos'
	],
	#category : #'Objetos2-CuOOra'
}

{ #category : #initialization }
Pregunta >> initialize [
	respuestas := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]
