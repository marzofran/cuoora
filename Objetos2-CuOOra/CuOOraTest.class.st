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
	|topicos|
	usuario := UsuarioCuOOra  conNombre: 'pepe' conContrasena: '2'.
	topicos := OrderedCollection new.
	topicos add: (Topico conNombre: 'TikTok' conDescripcion: 'Trends y cosas locas de la app de la cuarentena').
	cuOOra agregarPreguntaConTitulo: 'Babooshka?' conDescripcion: 'Did she do right?' conTopicos: topicos deUsuario: usuario. 
	
]

{ #category : #'as yet unclassified' }
CuOOraTest >> testCrearUsuario [
	cuOOra crearUsuarioConNombre: 'pepe' conContrasena: '2'.
	self denyEmpty: cuOOra usuarios.
	
	 
]
