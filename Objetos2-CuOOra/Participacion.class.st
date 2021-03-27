Class {
	#name : #Participacion,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fechaYHora',
		'likes',
		'dislikes'
	],
	#category : #'Objetos2-CuOOra'
}

{ #category : #construction }
Participacion class >> conDescripcion: unaDescripcion [ 
	^ self new initializeConDescripcion: unaDescripcion
]

{ #category : #initialization }
Participacion >> initialize [ 
	likes := OrderedCollection new.
	dislikes := OrderedCollection new.
	fechaYHora := DateAndTime now
]

{ #category : #initialization }
Participacion >> initializeConDescripcion: unaDescripcion [
	descripcion := unaDescripcion 
]
