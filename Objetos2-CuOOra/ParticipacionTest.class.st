Class {
	#name : #ParticipacionTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
ParticipacionTest >> setUp [
	|topicos|
	topicos := OrderedCollection new.
	topicos
		add:
			(Topico
				conNombre: 'Funcionamiento'
				conDescripcion: 'Sobre funcionamiento de tests en Pharo').
	pregunta := Pregunta
		conTitulo: 'Hola, funciona?'
		conDescripcion: 'Hola, acaso esto funciona?'
		conTopicos: topicos	"Hooks that subclasses may override to define the fixture of test."
]

{ #category : #tests }
ParticipacionTest >> testLikeDislike [
	| usuario |
	usuario := UsuarioCuOOra conNombre: 'Jorge Bell' conContrasena: 'ringring'.
	
	pregunta agregarLikeDe: usuario.
	self denyEmpty: pregunta likes.
	
	pregunta agregarDislikeDe: usuario.
	self assertEmpty: pregunta likes.
	self denyEmpty: pregunta dislikes.
	
	pregunta agregarLikeDe: usuario.
	self assertEmpty: pregunta dislikes.
	self denyEmpty: pregunta likes.
	
	pregunta borrarLikeDe: usuario.
	self assertEmpty: pregunta likes
]

{ #category : #test }
ParticipacionTest >> testPuntajeLikes [

	self flag: #toImplement.
	self assert: false
]
