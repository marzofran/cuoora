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
	super initialize.
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
	^ OrderedCollection withAll: (preguntas select: [ :unaPregunta | (preguntas indexOf: unaPregunta) <= 5 ])
]

{ #category : #rendering }
CuOOraHomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas paragraph with: [ 
		aCanvas strong: usuario nombre.
		aCanvas space.
		aCanvas anchor callback: [ ]; with: 'Log out'.
	].
	aCanvas horizontalRule.
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas
		unorderedList: [ (self preguntasVisibles) do: [ :each | aCanvas listItem: [
				aCanvas heading with: [ aCanvas emphasis: each titulo ]. 
				aCanvas paragraph with: [ 
					aCanvas text: 'Realizada por '.
					aCanvas strong: (cuoora usuarioQueHizoPregunta: each) nombre.
					aCanvas text: ' | ', each respuestas size, ' respuestas'.
				].
				aCanvas paragraph: each likes size, ' likes | ', each dislikes size, ' dislikes'.
				aCanvas horizontalRule.
		]]]
]
