Class {
	#name : #InteraccionTest,
	#superclass : #TestCase,
	#instVars : [
		'interaccion',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
InteraccionTest >> setUp [
	usuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: 'pepe' .
	interaccion := Interaccion conUsuario: usuario.

]

{ #category : #test }
InteraccionTest >> testEsDeUsuario [

	| otroUsuario |
	otroUsuario := UsuarioCuOOra conNombre: 'carlos' conContrasena: 'carlos' .
	self assert: (interaccion esDeUsuario: usuario).
	self deny: (interaccion esDeUsuario: otroUsuario).
]
