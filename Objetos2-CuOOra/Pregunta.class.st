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

{ #category : #construction }
Pregunta class >> conTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos [
	^ (self conDescripcion: unaDescripcion )
	initializeConTitulo: unTitulo conTopicos: unosTopicos 
]

{ #category : #initialization }
Pregunta >> initialize [
	respuestas := OrderedCollection new.
]

{ #category : #initialization }
Pregunta >> initializeConTitulo: unTitulo conTopicos: unosTopicos [
	titulo := unTitulo.
	topicos := unosTopicos 
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas
]
