Class {
	#name : #UsuarioCuOOra,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'contrasena',
		'fechaYHora',
		'following',
		'preguntas',
		'topicosFav'
	],
	#category : #'Objetos2-CuOOra'
}

{ #category : #'as yet unclassified' }
UsuarioCuOOra class >> conNombre: unNombre contrasena: unaContrasena [

	^ self new initializeCon: unNombre contrasena: unaContrasena 
]

{ #category : #'as yet unclassified' }
UsuarioCuOOra >> agregarPregunta: unaPregunta [

	preguntas add: unaPregunta.
]

{ #category : #'as yet unclassified' }
UsuarioCuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
]

{ #category : #'as yet unclassified' }
UsuarioCuOOra >> esMia: unaPregunta [

	^ preguntas includes: unaPregunta
]

{ #category : #accessing }
UsuarioCuOOra >> following [
	^ following
]

{ #category : #initialization }
UsuarioCuOOra >> initialize [
	
	following:= OrderedCollection new.
	topicosFav:= OrderedCollection new.
	preguntas:= OrderedCollection new.
]

{ #category : #initialization }
UsuarioCuOOra >> initializeCon: unNombre contrasena: unaContrasena [

	nombre := unNombre .
	contrasena := unaContrasena .
	fechaYHora := DateAndTime now.
]

{ #category : #accessing }
UsuarioCuOOra >> preguntas [

	^ preguntas
]

{ #category : #accessing }
UsuarioCuOOra >> topicosFav [

	^ topicosFav 
]
