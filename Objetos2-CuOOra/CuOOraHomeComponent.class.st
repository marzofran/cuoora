Class {
	#name : #CuOOraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'usuario'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
CuOOraHomeComponent >> initialize [
	cuoora := CuOOra new.
	usuario := cuoora crearUsuarioConNombre: 'Levi' conContrasena: 'escobitas'.
	cuoora crearUsuarioConNombre: 'Link' conContrasena: 'epona'.
	cuoora crearUsuarioConNombre: 'Jotaro' conContrasena: 'oraora'.
	
]

{ #category : #queries }
CuOOraHomeComponent >> preguntasVisibles [
	| preguntas |
	preguntas := (cuoora preguntasRelevantesDe: usuario)
		sort: [ :p1 :p2 | p1 fechaYHora <= p2 fechaYHora ].
	^ OrderedCollection
		with: (preguntas at: 1)
		with: (preguntas at: 2)
		with: (preguntas at: 3)
		with: (preguntas at: 4)
		with: (preguntas at: 5)
]

{ #category : #rendering }
CuOOraHomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas horizontalRule.
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas
		unorderedList: [ (self preguntasVisibles) do: [ :each | 
				aCanvas heading with: [ aCanvas emphasis: each titulo ]. 
				aCanvas paragraph with: [ 
					aCanvas text: 'Realizada por'.
				] 
		] ]
]
