Class {
	#name : #UsuarioCuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'following',
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

{ #category : #tests }
UsuarioCuOOraTest >> testFollowing [
	
	usuario seguir: otroUsuario.
	self denyEmpty: (usuario following)
]
