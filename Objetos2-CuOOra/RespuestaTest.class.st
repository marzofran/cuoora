Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'respuesta'
	],
	#category : #'Objetos2-CuOOra-Tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	usuario := UsuarioCuOOra conNombre: 'pepe' conContrasena: 'pepe' .
	respuesta := Respuesta conDescripcion: 'Buena pregunta!' conUsuario: usuario.

]

{ #category : #test }
RespuestaTest >> testEsDeUsuario [

	| otroUsuario |
	otroUsuario := UsuarioCuOOra conNombre: 'carlos' conContrasena: 'carlos' .
	self assert: (respuesta esDeUsuario: usuario).
	self deny: (respuesta esDeUsuario: otroUsuario).
]
