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
UsuarioCuOOra >> agregarPregunta: unaPregunta [

	preguntas add: unaPregunta.
]

{ #category : #'as yet unclassified' }
UsuarioCuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
]
