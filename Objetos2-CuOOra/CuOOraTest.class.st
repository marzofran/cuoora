Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	cuOOra := CuOOra new.

]

{ #category : #tests }
CuOOraTest >> testCalcularPuntaje [
	|topicos p p1 otroUsuario|
	usuario := UsuarioCuOOra  conNombre: 'pepe' conContrasena: '2'.
	otroUsuario := UsuarioCuOOra conNombre: 'levi' conContrasena: 'escoba'.
	topicos := OrderedCollection new.
	topicos add: (Topico conNombre: 'TikTok' conDescripcion: 'Trends y cosas locas de la app de la cuarentena').
	p:= Pregunta conTitulo: 'Babooshka?' conDescripcion: 'Did she do right?' conTopicos: topicos.
	cuOOra agregarPregunta: p de: usuario.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	p agregarRespuestaDe: otroUsuario conDescripcion: 'Ya yaaaa!'.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	p agregarRespuestaDe: usuario conDescripcion: 'Im all yours!'.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	p1:= Pregunta conTitulo: 'Macintosh Plus?' conDescripcion: 'How will I make up my mind?' conTopicos: topicos.
	cuOOra agregarPregunta: p1 de: otroUsuario .
	p1 agregarRespuestaDe: usuario conDescripcion: 'Time is running out!'.
	cuOOra agregarPreguntaConTitulo: 'Esta es la ultima' conDescripcion: 'equisdeeee' conTopicos: topicos  deUsuario: usuario. 
	p agregarLikeDe: otroUsuario .
	p1 agregarLikeDe: usuario.
	self assert: (cuOOra calcularPuntaje: otroUsuario ) equals: 71.
	p1 agregarDislikeDe: otroUsuario.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 91.
	self deny: (cuOOra calcularPuntaje: usuario) equals: 5.
	self assert: (cuOOra calcularPuntaje: otroUsuario ) equals: 70.
	
]

{ #category : #'as yet unclassified' }
CuOOraTest >> testCrearUsuario [
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self denyEmpty: cuOOra usuarios.
	
	 
]
