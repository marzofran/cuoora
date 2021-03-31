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
	#category : #'Objetos2-CuOOra-Model'
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
UsuarioCuOOra >> agregarTopicoFavorito: unTopico [

	topicosFav add: unTopico .
]

{ #category : #'adding/removing' }
UsuarioCuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
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
UsuarioCuOOra >> nombre [
	^ nombre
]

{ #category : #accessing }
UsuarioCuOOra >> preguntas [

	^ preguntas
]

{ #category : #queries }
UsuarioCuOOra >> respuestasAMisPreguntas [

	^ preguntas flatCollect: [ :pregunta | pregunta respuestas ]
]

{ #category : #'adding/removing' }
UsuarioCuOOra >> seguir: unUsuario [

	following add: unUsuario 
]

{ #category : #accessing }
UsuarioCuOOra >> topicosFav [

	^ topicosFav 
]

{ #category : #queries }
UsuarioCuOOra >> yoHice: unaPregunta [
	^ preguntas anySatisfy: [ :pregunta | pregunta == unaPregunta ]
]
