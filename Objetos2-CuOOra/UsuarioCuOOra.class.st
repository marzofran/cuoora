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

{ #category : #construction }
UsuarioCuOOra class >> conNombre: unNombre conContrasena: unaContrasena [

	^ self new initializeConNombre: unNombre conContrasena: unaContrasena 
]

{ #category : #'adding/removing' }
UsuarioCuOOra >> agregarPregunta: unaPregunta [

	preguntas add: unaPregunta.
]

{ #category : #'adding/removing' }
UsuarioCuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
]

{ #category : #queries }
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
UsuarioCuOOra >> initializeConNombre: unNombre conContrasena: unaContrasena [

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
