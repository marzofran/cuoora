Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#category : #'Objetos2-CuOOra'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarPregunta: unTitulo descripcion: unaDescripcion topicos: unosTopicos usuario: unUsuario [
	| p |
	p := Pregunta new: unTitulo.
	preguntas add: p.
	usuarios agregarPregunta: p.
	
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopico: unNombre descripcion: unaDescripcion [

	"topicos add: (Topico new: unNombre desc: unaDescripcion)."
]

{ #category : #'as yet unclassified' }
CuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
	usuarios borrarPregunta: unaPregunta.
]

{ #category : #'as yet unclassified' }
CuOOra >> buscarUsuarioQueHizo: unaPregunta [

	^  usuarios detect: [ :usuario | usuario esMia: unaPregunta]
]

{ #category : #'as yet unclassified' }
CuOOra >> crearUsuario: unNombre contrasena: unaContrasena [ 

	usuarios add: (UsuarioCuOOra conNombre: unNombre contrasena: unaContrasena).
]

{ #category : #initialization }
CuOOra >> initialize [ 
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
CuOOra >> preguntasDe: unTopico [

	^ preguntas collect: [ :pregunta | pregunta esDe: unTopico ]
]

{ #category : #queries }
CuOOra >> preguntasRelevantesDe: unUsuario [
	| topicosF | topicosF :=unUsuario topicosFav.
	topicosF do: [ :topico |  ].
	preguntas collect: [ :pregunta | pregunta esDeTopico: (unUsuario topicosFav do: [:topico | ^topico])  ] 
]

{ #category : #queries }
CuOOra >> respuestasDe: unUsuario [

	^ preguntas collect: [ :pregunta | pregunta respuestasDe: unUsuario ]
]
