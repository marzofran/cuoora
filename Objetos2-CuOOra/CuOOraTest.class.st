Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuOOra'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	cuOOra := CuOOra new.

]

{ #category : #tests }
CuOOraTest >> testCalcularPuntaje [
	| usuario otroUsuario topicos p p1 |
	usuario := UsuarioCuOOra  conNombre: 'pepe' conContrasena: '2'.
	otroUsuario := UsuarioCuOOra conNombre: 'levi' conContrasena: 'escoba'.
	cuOOra agregarUsuario: usuario; agregarUsuario: otroUsuario.
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

{ #category : #tests }
CuOOraTest >> testCrearUsuario [
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self denyEmpty: cuOOra usuarios.
	
	 
]

{ #category : #tests }
CuOOraTest >> testPreguntasDeTopico [
	| topico1 topico2 topicos otrosTopicos usuario|
	topico1 := Topico conNombre: 'Smalltalk' conDescripcion: 'About oop languaje Smalltalk.'.
	topico2 := Topico conNombre: 'JavaScript' conDescripcion: 'Pretty nice but not Smalltalk'.
	cuOOra agregarTopico: topico1; agregarTopico: topico2.
	usuario := UsuarioCuOOra conNombre: 'Pepe' conContrasena: 'pharorulzok'.
	cuOOra agregarUsuario: usuario.
	topicos := OrderedCollection with: topico1.
	otrosTopicos := OrderedCollection with: topico2.
	cuOOra agregarPreguntaConTitulo: 'Seaside 3.0' conDescripcion: 'Hola, no puedo instalarlo como ago' conTopicos: topicos deUsuario: usuario.
	
	self assert: (cuOOra preguntas size) equals: 1.
	self assert: ((cuOOra preguntasDe: topico1) size) equals: 1.
	self assert: ((cuOOra preguntasDe: topico2) size) equals: 0.
	
	cuOOra agregarPreguntaConTitulo: 'Iceberg' conDescripcion: 'Hola, no me anda' conTopicos: topicos deUsuario: usuario.
	
	self assert: (cuOOra preguntas size) equals: 2.
	self assert: ((cuOOra preguntasDe: topico1) size) equals: 2.
	self assert: ((cuOOra preguntasDe: topico2) size) equals: 0.
	
	cuOOra agregarPreguntaConTitulo: 'ReactJS' conDescripcion: 'Hola, donde lo descargo?' conTopicos: otrosTopicos deUsuario: usuario.
	
	self assert: (cuOOra preguntas size) equals: 3.
	self assert: ((cuOOra preguntasDe: topico1) size) equals: 2.
	self assert: ((cuOOra preguntasDe: topico2) size) equals: 1.
]
