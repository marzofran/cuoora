Class {
	#name : #CuOOraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'usuario',
		'topicos',
		'titulo',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
CuOOraHomeComponent >> descripcion [ 

^descripcion
]

{ #category : #accessing }
CuOOraHomeComponent >> descripcion: aString [

	descripcion := aString.
]

{ #category : #initialization }
CuOOraHomeComponent >> hardcodeModel [
	|topico1 topico2 otrosTopicos usuario2|
	usuario := cuoora
		crearUsuarioConNombre: 'Levi'
		conContrasena: 'escobitas'.
	usuario2 := cuoora
		crearUsuarioConNombre: 'Link'
		conContrasena: 'epona'.
	cuoora crearUsuarioConNombre: 'Jotaro' conContrasena: 'oraora'.
	topico1 := cuoora
		agregarTopicoConNombre: 'Smalltalk'
		conDescripcion: 'POO Supremacy'.
	topico2 := cuoora
		agregarTopicoConNombre: 'Rinfo'
		conDescripcion: 'Hell'.
	topicos := OrderedCollection with: topico1.
	otrosTopicos := OrderedCollection with: topico2.
	cuoora
		agregarPreguntaConTitulo: 'Seaside 3.0'
		conDescripcion: 'Como lo instalo??'
		conTopicos: topicos
		deUsuario: usuario.
	cuoora
		agregarPreguntaConTitulo: 'Mis robotos no paran de explotar'
		conDescripcion: 'Por favor ayuda con este codigo [inserte codigo imaginario aqui]'
		conTopicos: otrosTopicos
		deUsuario: usuario2.
	usuario agregarTopicoFavorito: topico1.
	usuario agregarTopicoFavorito: topico2
]

{ #category : #initialization }
CuOOraHomeComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance.
	self hardcodeModel
	 
	
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
	aCanvas div
		with:
			[ aCanvas heading: 'CuOOra'.
			aCanvas paragraph
				class: 'floating-right';
				with: [ aCanvas strong: usuario nombre.
					aCanvas space.
					aCanvas anchor
						callback: [ self answer ];
						with: 'Log out' ] ] .
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas unorderedList
		with: [ self preguntasVisibles
				do: [ :each | 
					aCanvas listItem
						class: 'pregunta';
						with: [ 
							"self renderPregunta: each en: aCanvas"
							aCanvas heading
								level: 3;
								with: [ aCanvas emphasis: each titulo ].
							aCanvas
								paragraph: [ aCanvas text: 'Realizada por '.
									aCanvas strong: (cuoora usuarioQueHizoPregunta: each) nombre.
									aCanvas
										text: ' | ' , each respuestas size asString , ' respuestas' ].
							"self renderLikesDislikes: aCanvas.   <--- algo asi"
							aCanvas anchor
								callback: [ each agregarLikeDe: usuario ];
								with: each likes size asString , ' likes'.
							aCanvas text: ' | '.
							aCanvas anchor
								callback: [ each agregarDislikeDe: usuario ];
								with: each dislikes size asString , ' dislikes' ] ] ].
	aCanvas horizontalRule.
	aCanvas form
		class: 'question-form';
		with: [ aCanvas heading
				level: 3;
				with: 'Crear una pregunta nueva'.
			aCanvas
				paragraph: [ aCanvas label: 'Titulo: '.
					aCanvas textInput on: #titulo of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'Descripcion: '.
					(aCanvas textArea
						on: #descripcion of: self) columns: 80; rows: 5;
						class: 'descripcion-input' ].
			aCanvas submitButton
				class: 'submit-button';
				callback: [ cuoora
						agregarPreguntaConTitulo: titulo
						conDescripcion: descripcion
						conTopicos: topicos
						deUsuario: usuario ];
				with: 'Crear!' ]
]

{ #category : #accessing }
CuOOraHomeComponent >> titulo [ 
	^ titulo
]

{ #category : #accessing }
CuOOraHomeComponent >> titulo: aString [

	titulo:= aString
]

{ #category : #updating }
CuOOraHomeComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
		ul {
			list-style-type: none
		}
		
		.floating-right { 
			text-align: right;
		}
		
		body { 
			font-family: sans-serif;
			background-color: #9cc599;
		}

		h1 { 
			font-weight: 500;
			font-size: 3rem;
		}

		.question-form { 
			text-align: center;
			background-color: #e8f1e7;
			margin: auto;
			width: 30%;
			background: white;
			border-radius: 10px;
			padding: 10px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
			
		.pregunta { 
			background-color: #e8f1e7;
			background: white;
			margin-horizontal: auto;
			margin-top: 10px;
			border-radius: 10px;
			padding: 10px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
			
		.submit-button { 
			color: white;
			background-color: #64a460;
		}
			
		input { 
			box-sizing: border-box;
			width: 100%;
			padding:10px;
			border-radius:10px;
		}
		
		.descripcion-input { 
			height: 200px;
			width: 98%;
			border-radius:10px;
			padding: 10px;
		}
		
		'.
]
