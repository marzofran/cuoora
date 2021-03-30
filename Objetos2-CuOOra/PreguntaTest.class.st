Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	topicos := OrderedCollection new.
	topicos add: (Topico conNombre: 'Funcionamiento' conDescripcion: 'Sobre funcionamiento de tests en Pharo').
	pregunta := Pregunta conTitulo: 'Hola, funciona?' conDescripcion: 'Hola, acaso esto funciona?' conTopicos: topicos.
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuestaDe [
	| usuario |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	pregunta agregarRespuestaDe: usuario conDescripcion: 'Si, funciona!'.
	self denyEmpty: pregunta respuestas.
	self assert: (pregunta respuestas first esDeUsuario: usuario).
	self assert: (pregunta respuestas first descripcion = 'Si, funciona!').
]

{ #category : #tests }
PreguntaTest >> testLikeDislike [
	| usuario |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
]

{ #category : #tests }
PreguntaTest >> testRespuestas [
	| usuario r1 r2 |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	r1 := Respuesta conDescripcion: 'Si' conUsuario: usuario.
	r2 := Respuesta conDescripcion: 'No' conUsuario: usuario.
	pregunta agregarRespuesta: r1; agregarRespuesta: r2.
	
	self assert: (pregunta respuestas first == r1).
	self assert: (pregunta respuestas last == r2).
	
	r2 agregarLikeDe: usuario.
	
	self assert: (pregunta respuestas first == r2).
	self assert: (pregunta respuestas last == r1).
]
