Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'respuesta',
		'topicos',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	topicos := OrderedCollection new.
	topicos add: (Topico conNombre: 'Funcionamiento' conDescripcion: 'Sobre funcionamiento de tests en Pharo').
	pregunta := Pregunta conTitulo: 'Hola, funciona?' conDescripcion: 'Hola, acaso esto funciona?' conTopicos: topicos
]
