Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'topico'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	topico := Topico conNombre: 'Funcionamiento' conDescripcion: 'Sobre funcionamiento de tests en Pharo'.
	pregunta := Pregunta conTitulo: 'Hola, funciona?' conDescripcion: 'Hola, acaso esto funciona?' conTopicos: (OrderedCollection with: topico).
]

{ #category : #tests }
PreguntaTest >> testAgregarRespuestaDeConDescripcion [
	| usuario |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	pregunta agregarRespuestaDe: usuario conDescripcion: 'Si, funciona!'.
	self denyEmpty: pregunta respuestas.
	self assert: (pregunta respuestas first esDeUsuario: usuario).
	self assert: (pregunta respuestas first descripcion = 'Si, funciona!').
]

{ #category : #test }
PreguntaTest >> testBorrarRespuestas [

	| unUsuario otroUsuario |
	unUsuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: 'pepe'.
	otroUsuario := UsuarioCuOOra conNombre: 'carlos' conContrasena: 'carlos'.
	
	self assertEmpty: pregunta respuestas.
	pregunta agregarRespuestaDe: unUsuario conDescripcion: 'hola'.
	pregunta agregarRespuestaDe: otroUsuario conDescripcion: 'chau'.
	self denyEmpty: pregunta respuestas.
	
	pregunta borrarRespuestas.
	self assertEmpty: pregunta respuestas.
]

{ #category : #test }
PreguntaTest >> testEsDeTopico [

	| otroTopico |
	otroTopico := Topico conNombre: 'Este topico no es el mismo' conDescripcion: 'no, no lo es'.
	self assert: (pregunta esDeTopico: topico).
	self deny: (pregunta esDeTopico: otroTopico)
]

{ #category : #tests }
PreguntaTest >> testRespuestas [
	| usuario r1 r2 |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	r1 := pregunta agregarRespuestaDe: usuario conDescripcion: 'Si'. 
	r2 := pregunta agregarRespuestaDe: usuario conDescripcion: 'Si'. 
	
	self assert: (pregunta respuestas first == r1).
	self assert: (pregunta respuestas last == r2).
	
	r2 agregarLikeDe: usuario.
	
	self assert: (pregunta respuestas first == r2).
	self assert: (pregunta respuestas last == r1).
]

{ #category : #test }
PreguntaTest >> testRespuestasDe [

	| unUsuario otroUsuario |
	unUsuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: 'pepe'.
	otroUsuario := UsuarioCuOOra conNombre: 'carlos' conContrasena: 'carlos'.
	
	self assert: (pregunta respuestasDe: unUsuario) size equals: 0.
	self assert: (pregunta respuestasDe: otroUsuario) size equals: 0.
	
	pregunta agregarRespuestaDe: unUsuario conDescripcion: 'hola'.
	self assert: (pregunta respuestasDe: unUsuario) size equals: 1.
	self assert: (pregunta respuestasDe: otroUsuario) size equals: 0.
	
	pregunta agregarRespuestaDe: unUsuario conDescripcion: 'chau'.
	self assert: (pregunta respuestasDe: unUsuario) size equals: 2.
	self assert: (pregunta respuestasDe: otroUsuario) size equals: 0.
	
	pregunta agregarRespuestaDe: otroUsuario conDescripcion: 'hola'.
	self assert: (pregunta respuestasDe: unUsuario) size equals: 2.
	self assert: (pregunta respuestasDe: otroUsuario) size equals: 1.
]
