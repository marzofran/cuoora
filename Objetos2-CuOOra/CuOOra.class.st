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
