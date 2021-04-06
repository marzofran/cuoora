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

	| nuevoTopico |	
	nuevoTopico := Topico conNombre: unNombre conDescripcion: unaDescripcion.
	topicos detect: [ :each | each nombre = (unNombre asLowercase) ]
	ifFound: [ :eseTopico | ^ eseTopico ]
	ifNone: [ ^ topicos add: nuevoTopico ]
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
		detect: [ :each | each nombre = unNombre ]
		ifFound: [ :eseUsuario | ^ eseUsuario ]
		ifNone: [ ^ usuarios add: nuevoUsuario ]
]

{ #category : #initialization }
CuOOra >> hardcodeModel [
	|topico1 topico2 usuario1 usuario2 usuario3|
	usuario1 := self 
		crearUsuarioConNombre: 'Marzo'
		conContrasena: 'abril'.
	usuario2 := self
		crearUsuarioConNombre: 'Camilo'
		conContrasena: 'vocaloid'.
	usuario3 := self crearUsuarioConNombre: 'Diego Torres' 
		conContrasena: 'el cantante'.
	topico1 := self
		agregarTopicoConNombre: 'Smalltalk'
		conDescripcion: 'POO Supremacy'.
	topico2 := self
		agregarTopicoConNombre: 'Pharo'
		conDescripcion: 'Near the sea'.
	usuario1 agregarTopicoFavorito: topico1.
	usuario1 agregarTopicoFavorito: topico2.
	usuario2 agregarTopicoFavorito: topico2.
	usuario3 agregarTopicoFavorito: topico1.
]

{ #category : #initialization }
CuOOra >> initialize [ 
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
	self hardcodeModel.
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

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #queries }
CuOOra >> usuarioConNombre: unNombre conContrasena: unaContrasena [
	^ usuarios
		detect:
			[ :unUsuario | unUsuario nombre = unNombre & (unUsuario contrasena = unaContrasena) ]
		ifNone: [ nil ]
]

{ #category : #queries }
CuOOra >> usuarioQueHizoPregunta: unaPregunta [
	^ usuarios detect: [ :unUsuario | unUsuario yoHice: unaPregunta ]
]

{ #category : #accessing }
CuOOra >> usuarios [

	^ usuarios
]
