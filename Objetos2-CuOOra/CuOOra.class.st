Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #testing }
CuOOra >> agregarPregunta: unaPregunta de: unUsuario [

	preguntas add: unaPregunta.
	unUsuario agregarPregunta: unaPregunta.
]

{ #category : #'adding/removing' }
CuOOra >> agregarPreguntaConTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos deUsuario: unUsuario [
	| p |
	p := Pregunta conTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos.
	preguntas add: p.
	usuarios agregarPregunta: p.
	
]

{ #category : #'adding/removing' }
CuOOra >> agregarTopicoConNombre: unNombre conDescripcion: unaDescripcion [

	topicos add: (Topico conNombre: unNombre conDescripcion: unaDescripcion )
]

{ #category : #'adding/removing' }
CuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
	usuarios borrarPregunta: unaPregunta.
]

{ #category : #queries }
CuOOra >> calcularPuntaje: unUsuario [
	| misInteracciones |
	misInteracciones := (OrderedCollection withAll: unUsuario preguntas).
	misInteracciones addAll: ((self respuestasDe: unUsuario) difference: (unUsuario respuestasAMisPreguntas)).
	^misInteracciones puntos + misInteracciones puntajeLikes
]

{ #category : #'adding/removing' }
CuOOra >> crearUsuarioConNombre: unNombre conContrasena: unaContrasena [ 

	usuarios add: (UsuarioCuOOra conNombre: unNombre conContrasena: unaContrasena).
]

{ #category : #initialization }
CuOOra >> initialize [ 
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #queries }
CuOOra >> preguntasDe: unTopico [

	^ preguntas collect: [ :pregunta | pregunta esDe: unTopico ]
]

{ #category : #queries }
CuOOra >> preguntasRelevantesDe: unUsuario [
	^ (unUsuario topicosFav
		flatCollect: [ :topico | self preguntasDe: topico ])
		union: (unUsuario following flatCollect: [ :follow | follow preguntas ])
]

{ #category : #queries }
CuOOra >> respuestasDe: unUsuario [

	^ (preguntas collect: [ :pregunta | pregunta respuestasDe: unUsuario ])
]

{ #category : #testing }
CuOOra >> usuarios [

	^ usuarios
]
