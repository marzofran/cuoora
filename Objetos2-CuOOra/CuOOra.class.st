Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [ 
	soleInstance := nil
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'adding/removing' }
CuOOra >> agregarPreguntaConTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos deUsuario: unUsuario [
	| p |
	p := Pregunta conTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos.
	preguntas add: p.
	unUsuario agregarPregunta: p.
	^ p
	
]

{ #category : #'adding/removing' }
CuOOra >> agregarTopicoConNombre: unNombre conDescripcion: unaDescripcion [

	^ topicos add: (Topico conNombre: unNombre conDescripcion: unaDescripcion)
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
	misInteracciones addAll: (self respuestasDe: unUsuario).
	misInteracciones removeAllFoundIn: (unUsuario respuestasAMisPreguntas).
	^misInteracciones sumNumbers: [:interaccion | interaccion puntos + interaccion puntajeLikes ]
]

{ #category : #'adding/removing' }
CuOOra >> crearUsuarioConNombre: unNombre conContrasena: unaContrasena [
	| nuevoUsuario |
	nuevoUsuario := UsuarioCuOOra
		conNombre: unNombre
		conContrasena: unaContrasena.
	usuarios
		detect: [ :each | each nombre == unNombre ]
		ifNone: [ ^ usuarios add: nuevoUsuario ]
]

{ #category : #initialization }
CuOOra >> initialize [ 
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #queries }
CuOOra >> preguntasDe: unTopico [

	^ preguntas select: [ :pregunta | pregunta esDeTopico: unTopico ]
]

{ #category : #queries }
CuOOra >> preguntasRelevantesDe: unUsuario [
	^ (unUsuario topicosFav
		flatCollect: [ :topico | self preguntasDe: topico ])
		union: (unUsuario following flatCollect: [ :follow | follow preguntas ])
]

{ #category : #queries }
CuOOra >> respuestasDe: unUsuario [

	^ (preguntas flatCollect: [ :pregunta | pregunta respuestasDe: unUsuario ])
]

{ #category : #queries }
CuOOra >> usuarioQueHizoPregunta: unaPregunta [
	^ usuarios detect: [ :unUsuario | unUsuario yoHice: unaPregunta ]
]

{ #category : #accessing }
CuOOra >> usuarios [

	^ usuarios
]
