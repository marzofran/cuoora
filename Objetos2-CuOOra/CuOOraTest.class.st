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
	|topicos p otroUsuario|
	usuario := UsuarioCuOOra  conNombre: 'pepe' conContrasena: '2'.
	otroUsuario := 
	topicos := OrderedCollection new.
	topicos add: (Topico conNombre: 'TikTok' conDescripcion: 'Trends y cosas locas de la app de la cuarentena').
	p:= Pregunta conTitulo: 'Babooshka?' conDescripcion: 'Did she do right?' conTopicos: topicos.
	cuOOra agregarPregunta: p de: usuario.
	
	
	
	
]

{ #category : #'as yet unclassified' }
CuOOraTest >> testCrearUsuario [
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self denyEmpty: cuOOra usuarios.
	
	 
]
