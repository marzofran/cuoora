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
	|topico1 topico2 topicos otrosTopicos usuario2|
	super initialize.
	cuoora := CuOOra new.
	usuario := cuoora crearUsuarioConNombre: 'Levi' conContrasena: 'escobitas'.
	usuario2 := cuoora crearUsuarioConNombre: 'Link' conContrasena: 'epona'.
	cuoora crearUsuarioConNombre: 'Jotaro' conContrasena: 'oraora'.
	topico1 := cuoora agregarTopicoConNombre: 'Smalltalk' conDescripcion: 'POO Supremacy'.
	topico2 := cuoora agregarTopicoConNombre: 'Rinfo' conDescripcion: 'Hell'.
	topicos := OrderedCollection with: topico1.
	otrosTopicos := OrderedCollection with: topico2.
	cuoora agregarPreguntaConTitulo: 'Seaside 3.0' conDescripcion: 'Como lo instalo??' conTopicos: topicos deUsuario: usuario.
	cuoora agregarPreguntaConTitulo: 'Mis robotos no paran de explotar' conDescripcion: 'Por favor ayuda con este codigo [inserte codigo imaginario aqui]' conTopicos: otrosTopicos deUsuario: usuario2.
	
	usuario agregarTopicoFavorito: topico1.
	usuario agregarTopicoFavorito: topico2.
	 
	
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
	aCanvas paragraph: [ 
		aCanvas strong: usuario nombre.
		aCanvas space.
		aCanvas anchor callback: [ ]; with: 'Log out'.
	].
	aCanvas horizontalRule.
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas
		unorderedList with: [ (self preguntasVisibles) do: [ :each | aCanvas listItem: [
				aCanvas heading level: 3; with: [ aCanvas emphasis: each titulo ]. 
				aCanvas paragraph: [ 
					aCanvas text: 'Realizada por '.
					aCanvas strong: (cuoora usuarioQueHizoPregunta: each) nombre.
					aCanvas text: ' l ' , each respuestas size asString , ' respuestas'.
				].
				aCanvas paragraph: each likes size asString , ' likes l ' , each dislikes size asString , ' dislikes'.
				aCanvas horizontalRule.
		]]]
]
