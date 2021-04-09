Class {
	#name : #UsuarioCuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
UsuarioCuOOraTest >> setUp [
	usuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: '2' .
	

]

{ #category : #test }
UsuarioCuOOraTest >> testAgregarPregunta [
	| pregunta |
	pregunta := Pregunta
		conTitulo: 'Hola?'
		conDescripcion: 'Hay alguien ahi?'
		conTopicos:
			(OrderedCollection
				with: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy')).
	self assertEmpty: usuario preguntas.
	usuario agregarPregunta: pregunta.
	self assert: usuario preguntas size equals: 1.
]

{ #category : #test }
UsuarioCuOOraTest >> testAgregarTopicoFavorito [

	self assertEmpty: usuario topicosFav.
	usuario agregarTopicoFavorito: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy').
	self denyEmpty: usuario topicosFav.
	usuario agregarTopicoFavorito: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy').
	self assert: usuario topicosFav size equals: 1.
]

{ #category : #test }
UsuarioCuOOraTest >> testBorrarPregunta [
	| pregunta pregunta2 |
	pregunta := Pregunta
		conTitulo: 'Hola?'
		conDescripcion: 'Hay alguien ahi?'
		conTopicos:
			(OrderedCollection
				with: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy')).
	pregunta2 := Pregunta
		conTitulo: 'Si?'
		conDescripcion: 'No hay nadie aqui :C'
		conTopicos:
			(OrderedCollection
				with: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy')).
	self assertEmpty: usuario preguntas.
	usuario agregarPregunta: pregunta.
	usuario agregarPregunta: pregunta2.
	self assert: usuario preguntas size equals: 2.
	usuario borrarPregunta: pregunta.
	self assert: usuario preguntas size equals: 1.
	usuario borrarPregunta: pregunta2.
	self assertEmpty: usuario preguntas.
	usuario borrarPregunta: pregunta2.
	self assertEmpty: usuario preguntas
]

{ #category : #test }
UsuarioCuOOraTest >> testRespuestasAMisPreguntas [
	| otroUsuario pregunta |
	otroUsuario := UsuarioCuOOra conNombre: 'juanita' conContrasena: '3'.
	pregunta := Pregunta
				conTitulo: 'Hola?'
				conDescripcion: 'Hay alguien ahi?'
				conTopicos:
					(OrderedCollection
						with: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy')).
	 usuario
		agregarPregunta:
			pregunta.
	self assertEmpty: usuario respuestasAMisPreguntas.
	
	pregunta agregarRespuestaDe: usuario conDescripcion: 'Ayuda plis.'.
	self assert: usuario respuestasAMisPreguntas size equals: 1.
	
	pregunta agregarRespuestaDe: otroUsuario conDescripcion: 'Yo te ayudo!'.
	self assert: usuario respuestasAMisPreguntas size equals: 2.
]

{ #category : #test }
UsuarioCuOOraTest >> testSeguir [

	| otroUsuario |
	otroUsuario:= UsuarioCuOOra conNombre: 'juanita' conContrasena: '3'. 
	usuario seguir: otroUsuario.
	self denyEmpty: (usuario following).
	self assert: ((usuario following) includes: otroUsuario).
	
	usuario seguir: otroUsuario.
	self assert: usuario following size equals: 1.
]

{ #category : #test }
UsuarioCuOOraTest >> testYoHice [

	| pregunta |
	pregunta := Pregunta
		conTitulo: 'Hola?'
		conDescripcion: 'Hay alguien ahi?'
		conTopicos:
			(OrderedCollection
				with: (Topico conNombre: 'Smalltalk' conDescripcion: 'POO Supremacy')).
	usuario agregarPregunta: pregunta.
	self assert: (usuario yoHice: pregunta).
]
