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

{ #category : #test }
CuOOraTest >> testAgregarPreguntaConTituloConDescripcionConTopicosDeUsuario [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
CuOOraTest >> testAgregarTopicoConNombreConDescripcion [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
CuOOraTest >> testBorrarPregunta [

	self flag: #toImplement.
	self assert: false
]

{ #category : #tests }
CuOOraTest >> testCalcularPuntaje [
	| usuario otroUsuario topicos p p1 topico |
	usuario := cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	otroUsuario := cuOOra
		crearUsuarioConNombre: 'levi'
		conContrasena: 'escoba'.
	topico := cuOOra
		agregarTopicoConNombre: 'TikTok'
		conDescripcion: 'Trends y cosas locas de la app de la cuarentena'.
	topicos := OrderedCollection with: topico.
	p := cuOOra
		agregarPreguntaConTitulo: 'Babooshka?'
		conDescripcion: 'Did she do right?'
		conTopicos: topicos
		deUsuario: usuario.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	
	p agregarRespuestaDe: otroUsuario conDescripcion: 'Ya yaaaa!'.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	
	p agregarRespuestaDe: usuario conDescripcion: 'Im all yours!'.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 20.
	
	p1 := cuOOra
		agregarPreguntaConTitulo: 'Macintosh Plus?'
		conDescripcion: 'How will I make up my mind?'
		conTopicos: topicos
		deUsuario: otroUsuario.
	p1 agregarRespuestaDe: usuario conDescripcion: 'Time is running out!'.
	cuOOra
		agregarPreguntaConTitulo: 'Esta es la ultima'
		conDescripcion: 'equisdeeee'
		conTopicos: topicos
		deUsuario: usuario.
	p agregarLikeDe: otroUsuario.
	p1 agregarLikeDe: usuario.
	self assert: (cuOOra calcularPuntaje: otroUsuario) equals: 71.
	
	p1 agregarDislikeDe: otroUsuario.
	self assert: (cuOOra calcularPuntaje: usuario) equals: 91.
	self deny: (cuOOra calcularPuntaje: usuario) equals: 5.
	self assert: (cuOOra calcularPuntaje: otroUsuario) equals: 70
]

{ #category : #test }
CuOOraTest >> testCrearUsuarioConNombreConContrasena [
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self denyEmpty: cuOOra usuarios.
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self assert: cuOOra usuarios size equals: 1
]

{ #category : #test }
CuOOraTest >> testPreguntasDe [

	| topico1 topico2 topicos otrosTopicos usuario |
	topico1 := cuOOra
		agregarTopicoConNombre: 'Smalltalk'
		conDescripcion: 'About oop languaje Smalltalk.'.
	topico2 := cuOOra
		agregarTopicoConNombre: 'JavaScript'
		conDescripcion: 'Pretty nice but not Smalltalk'.
	usuario := cuOOra
		crearUsuarioConNombre: 'Pepe'
		conContrasena: 'pharorulzok'.
	topicos := OrderedCollection with: topico1.
	otrosTopicos := OrderedCollection with: topico2.
	cuOOra
		agregarPreguntaConTitulo: 'Seaside 3.0'
		conDescripcion: 'Hola, no puedo instalarlo como ago'
		conTopicos: topicos
		deUsuario: usuario.
	self assert: cuOOra preguntas size equals: 1.
	self assert: (cuOOra preguntasDe: topico1) size equals: 1.
	self assert: (cuOOra preguntasDe: topico2) size equals: 0.
	
	cuOOra
		agregarPreguntaConTitulo: 'Iceberg'
		conDescripcion: 'Hola, no me anda'
		conTopicos: topicos
		deUsuario: usuario.
	self assert: cuOOra preguntas size equals: 2.
	self assert: (cuOOra preguntasDe: topico1) size equals: 2.
	self assert: (cuOOra preguntasDe: topico2) size equals: 0.
	
	cuOOra
		agregarPreguntaConTitulo: 'ReactJS'
		conDescripcion: 'Hola, donde lo descargo?'
		conTopicos: otrosTopicos
		deUsuario: usuario.
	self assert: cuOOra preguntas size equals: 3.
	self assert: (cuOOra preguntasDe: topico1) size equals: 2.
	self assert: (cuOOra preguntasDe: topico2) size equals: 1
]

{ #category : #tests }
CuOOraTest >> testPreguntasRelevantesDe [
	| usuario topico topico2 topicos otrosTopicos otroUsuario usuarioSeguido preguntas |
	topico := cuOOra
		agregarTopicoConNombre: 'Smalltalk'
		conDescripcion: 'About oop languaje Smalltalk.'.
	topico2 := cuOOra
		agregarTopicoConNombre: 'JavaScript'
		conDescripcion: 'Pretty nice but not Smalltalk'.
	usuario := cuOOra
		crearUsuarioConNombre: 'Pepe'
		conContrasena: 'pharorulzok'.
	usuarioSeguido := cuOOra
		crearUsuarioConNombre: 'BabyShark'
		conContrasena: 'tutururuturu'.
	otroUsuario := cuOOra
		crearUsuarioConNombre: 'Levi'
		conContrasena: 'escoba'.
	topicos := OrderedCollection with: topico.
	otrosTopicos := OrderedCollection with: topico2.
	usuario agregarTopicoFavorito: topico.
	usuario agregarTopicoFavorito: topico2.
	preguntas := OrderedCollection new.
	preguntas
		add:
			(cuOOra
				agregarPreguntaConTitulo: 'Seaside 3.0'
				conDescripcion: 'Hola, no puedo instalarlo como ago'
				conTopicos: topicos
				deUsuario: otroUsuario).
	preguntas
		add:
			(cuOOra
				agregarPreguntaConTitulo: 'Matrices'
				conDescripcion: 'Hola, como se declaran?'
				conTopicos: otrosTopicos
				deUsuario: usuarioSeguido).
				topicos add: topico2.
				preguntas
		add:
			(cuOOra
				agregarPreguntaConTitulo: 'Herencia'
				conDescripcion: 'Hola, como funciona la herencia aca??'
				conTopicos: topicos
				deUsuario: usuario).
	usuario seguir: usuarioSeguido.
	self assert: (cuOOra preguntasRelevantesDe: usuario) size equals: 3.
	self assertCollection: (cuOOra preguntasRelevantesDe: usuario) hasSameElements: preguntas.
	
	usuario seguir: otroUsuario .
	self assert: (cuOOra preguntasRelevantesDe: usuario) size equals: 3.
]

{ #category : #tests }
CuOOraTest >> testRespuestasDe [
	| usuario topico topicos otroUsuario pregunta respuesta otraRespuesta respuestas |
	usuario := cuOOra
		crearUsuarioConNombre: 'levi'
		conContrasena: 'escoba'.
	otroUsuario := cuOOra
		crearUsuarioConNombre: 'pepe'
		conContrasena: '2'.
	topico := cuOOra
		agregarTopicoConNombre: 'TikTok'
		conDescripcion: 'Trends y cosas locas de la app de la cuarentena'.
	topicos := OrderedCollection with: topico.
	pregunta := cuOOra
		agregarPreguntaConTitulo: 'Seaside 3.0'
		conDescripcion: 'Hola, no puedo instalarlo como ago'
		conTopicos: topicos
		deUsuario: usuario.
	respuesta := pregunta
		agregarRespuestaDe: usuario
		conDescripcion: 'porfa ayudaaaa'.
	cuOOra
		agregarPreguntaConTitulo: 'ReactJS'
		conDescripcion: 'Hola, donde lo descargo?'
		conTopicos: topicos
		deUsuario: otroUsuario.
	otraRespuesta := pregunta
		agregarRespuestaDe: usuario
		conDescripcion: 'aca te dejo el link *zelda*'.
	respuestas := OrderedCollection with: respuesta.
	respuestas add: otraRespuesta.
	self assert: (cuOOra respuestasDe: usuario) equals: respuestas.
	self assert: (cuOOra respuestasDe: otroUsuario) isEmpty
]

{ #category : #tests }
CuOOraTest >> testUsuarioQueHizoPregunta [

	self flag: #toImplement.
	self assert: false.
]
