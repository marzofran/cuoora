Class {
	#name : #UsuarioCuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'otroUsuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
UsuarioCuOOraTest >> setUp [
	usuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: '2' .
	otroUsuario:= UsuarioCuOOra conNombre: 'juanita' conContrasena: '3'. 
	

]

{ #category : #test }
UsuarioCuOOraTest >> testAgregarPregunta [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
UsuarioCuOOraTest >> testAgregarTopicoFavorito [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
UsuarioCuOOraTest >> testBorrarPregunta [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
UsuarioCuOOraTest >> testRespuestasAMisPreguntas [

	self flag: #toImplement.
	self assert: false
]

{ #category : #test }
UsuarioCuOOraTest >> testSeguir [

	usuario seguir: otroUsuario.
	self denyEmpty: (usuario following).
	self assert: ((usuario following) includes: otroUsuario).
	
	usuario seguir: otroUsuario.
	self assert: usuario following size equals: 1.
]

{ #category : #test }
UsuarioCuOOraTest >> testYoHice [

	self flag: #toImplement.
	self assert: false
]
