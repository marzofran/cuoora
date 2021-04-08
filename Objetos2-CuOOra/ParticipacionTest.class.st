Class {
	#name : #ParticipacionTest,
	#superclass : #TestCase,
	#instVars : [
		'participacion'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
ParticipacionTest >> setUp [
	"|topicos|
	topicos := OrderedCollection new.
	topicos
		add:
			(Topico
				conNombre: 'Funcionamiento'
				conDescripcion: 'Sobre funcionamiento de tests en Pharo').
	pregunta := Pregunta
		conTitulo: 'Hola, funciona?'
		conDescripcion: 'Hola, acaso esto funciona?'
		conTopicos: topicos."
			
	participacion := Participacion conDescripcion: 'hola'.
]

{ #category : #tests }
ParticipacionTest >> testLikeDislike [
	| usuario |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	
	participacion agregarLikeDe: usuario.
	self denyEmpty: participacion likes.
	
	participacion agregarDislikeDe: usuario.
	self assertEmpty: participacion likes.
	self denyEmpty: participacion dislikes.
	
	participacion agregarLikeDe: usuario.
	self assertEmpty: participacion dislikes.
	self denyEmpty: participacion likes.
	
	participacion borrarLikeDe: usuario.
	self assertEmpty: participacion likes
]

{ #category : #test }
ParticipacionTest >> testPuntajeLikes [
	| usuario otroUsuario |
	usuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: 'pepe'.
	otroUsuario := UsuarioCuOOra conNombre: 'carlos' conContrasena: 'carlos'.
	
	self assert: participacion puntajeLikes equals: 0.
	
	participacion agregarLikeDe: usuario.
	self assert: participacion puntajeLikes equals: 1.
	
	participacion agregarLikeDe: otroUsuario.
	self assert: participacion puntajeLikes equals: 2.
	
	participacion agregarDislikeDe: usuario.
	self assert: participacion puntajeLikes equals: 0.
	
	participacion agregarDislikeDe: otroUsuario.
	self assert: participacion puntajeLikes equals: -2.
]
