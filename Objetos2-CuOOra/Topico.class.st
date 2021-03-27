Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'nombre'
	],
	#category : #'Objetos2-CuOOra'
}

{ #category : #construction }
Topico class >> conNombre: unNombre conDescripcion: unaDescripcion [ 
	^ self new initializeConNombre: unNombre conDescripcion: unaDescripcion 
]

{ #category : #initialization }
Topico >> initializeConNombre: unNombre conDescripcion: unaDescripcion [ 
	nombre := unNombre .
	descripcion := unaDescripcion 
]
