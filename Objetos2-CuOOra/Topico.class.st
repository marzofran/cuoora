Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'nombre'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #construction }
Topico class >> conNombre: unNombre conDescripcion: unaDescripcion [ 
	^ self new initializeConNombre: (unNombre asLowercase) conDescripcion: unaDescripcion 
]

{ #category : #accessing }
Topico >> descripcion [
	^ descripcion
]

{ #category : #initialization }
Topico >> initializeConNombre: unNombre conDescripcion: unaDescripcion [ 
	nombre := unNombre .
	descripcion := unaDescripcion 
]

{ #category : #accessing }
Topico >> nombre [
	^ nombre
]
