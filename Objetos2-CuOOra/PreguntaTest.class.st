Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topicos',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	topicos := OrderedCollection new.
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	topicos add: (Topico conNombre: 'Funcionamiento' conDescripcion: 'Sobre funcionamiento de tests en Pharo').
	pregunta := Pregunta conTitulo: 'Hola, funciona?' conDescripcion: 'Hola, acaso esto funciona?' conTopicos: topicos.
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	pregunta agregarRespuestaDe: usuario conDescripcion: 'Si, funciona!'.
	self denyEmpty: pregunta respuestas.
]
