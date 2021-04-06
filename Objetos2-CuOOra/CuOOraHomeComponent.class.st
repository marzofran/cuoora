Class {
	#name : #CuOOraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'topicos',
		'titulo',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
CuOOraHomeComponent >> crearPregunta [
	cuoora
		agregarPreguntaConTitulo: titulo
		conDescripcion: descripcion
		conTopicos: (self generarTopicosDesde: topicos)
		deUsuario: self session usuario.
	descripcion := nil.
	titulo := nil.
	topicos := nil
]

{ #category : #accessing }
CuOOraHomeComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CuOOraHomeComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #formatting }
CuOOraHomeComponent >> generarTopicosDesde: unString [

	^ ((unString splitOn: ',') collect: [ :substring | substring trimBoth ]) collect: [ :unNombre | cuoora agregarTopicoConNombre: unNombre conDescripcion: 'n/a' ]
]

{ #category : #initialization }
CuOOraHomeComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance.
	 
	
]

{ #category : #queries }
CuOOraHomeComponent >> preguntasVisibles [
	| preguntas |
	preguntas := (cuoora preguntasRelevantesDe: (self session usuario))
		sort: [ :p1 :p2 | p1 fechaYHora <= p2 fechaYHora ].
	^ OrderedCollection withAll: (preguntas select: [ :unaPregunta | (preguntas indexOf: unaPregunta) <= 5 ])
]

{ #category : #rendering }
CuOOraHomeComponent >> renderAgregarPreguntaOn: aCanvas [
	aCanvas form
		class: 'question-form';
		with: [ aCanvas heading
				level: 3;
				with: 'Crear una pregunta nueva'.
			aCanvas
				paragraph: [ aCanvas label: 'Título: '.
					aCanvas textInput on: #titulo of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'Descripción: '.
					(aCanvas textArea on: #descripcion of: self)
						columns: 80;
						rows: 5;
						class: 'descripcion-input' ].
			aCanvas
				paragraph: [ aCanvas label: 'Tópicos (separar con ,): '.
					aCanvas textInput on: #topicos of: self ].
			aCanvas submitButton
				class: 'submit-button';
				callback: [ self crearPregunta ];
				with: 'Crear!' ]
]

{ #category : #rendering }
CuOOraHomeComponent >> renderContentOn: aCanvas [
	self renderCuOOraHeaderOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph class: 'floating-right';
	class: 'nueva-pregunta-button';
	with: 'Hacer una nueva pregunta'.
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas unorderedList
		with: [ self preguntasVisibles
				do: [ :each | self renderPregunta: each on: aCanvas ] ].
	aCanvas horizontalRule.
	self renderAgregarPreguntaOn: aCanvas.
]

{ #category : #rendering }
CuOOraHomeComponent >> renderCuOOraHeaderOn: aCanvas [
	aCanvas div
		with: [ aCanvas paragraph
				class: 'floating-right';
				with: [ aCanvas strong: self session usuario nombre.
					aCanvas space.
					aCanvas anchor
						callback: [ self answer ];
						with: 'Log out' ].
			aCanvas heading: 'CuOOra']
]

{ #category : #rendering }
CuOOraHomeComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
	aCanvas div
		class: 'like-dislike-buttons';
		with: [ aCanvas anchor
				callback: [ unaPregunta agregarLikeDe: self session usuario ];
				with: 'like'.
			aCanvas text: ' | '.
			aCanvas anchor
				callback: [ unaPregunta agregarDislikeDe: self session usuario ];
				with: 'dislike' ].
	aCanvas paragraph: (unaPregunta likes size asString) , ' likes | ' , (unaPregunta dislikes size asString) , ' dislikes'
]

{ #category : #rendering }
CuOOraHomeComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas listItem
		class: 'pregunta';
		with: [ 
			aCanvas heading
				class: 'pregunta-titulo';
				level: 3;
				with: [ aCanvas emphasis: unaPregunta titulo ].
			aCanvas paragraph class: 'topicos'; with: [aCanvas emphasis with: 'Tópicos: ' , (self topicosComoStringDe: unaPregunta) , '.'].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					aCanvas strong: (cuoora usuarioQueHizoPregunta: unaPregunta) nombre.
					aCanvas
						text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ].
			self renderLikesDislikesDe: unaPregunta on: aCanvas ]

]

{ #category : #accessing }
CuOOraHomeComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
CuOOraHomeComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
CuOOraHomeComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOraHomeComponent >> topicos: anObject [
	topicos := anObject
]

{ #category : #queries }
CuOOraHomeComponent >> topicosComoStringDe: unaPregunta [
	
	^ String streamContents: [ :stream | (unaPregunta topicos collect: [ :unTopico | unTopico nombre ]) asStringOn: stream delimiter: ', '. ]
]

{ #category : #updating }
CuOOraHomeComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
		ul {
			list-style-type: none;
			margin: 30px auto;
			padding-horizontal: auto;
			width: 90%;
		}
		
		.floating-right { 
			float: right;
			margin-right: 20px;
		}
		
		.nueva-pregunta-button { 
			font-size: 1.5rem;
			margin-top: 30px;
		}
		
		body { 
			font-family: sans-serif;
			background-color: #9cc599;
		}

		h1 { 
			font-weight: 500;
			font-size: 3rem;
			margin-left: 20px;
		}

		.question-form { 
			text-align: center;
			background-color: #e8f1e7;
			margin: 20px auto;
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
			padding: 10px 20px;
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
			width: 94%;
			border-radius:10px;
			padding: 10px;
		}
		
		.like-dislike-buttons { 
			float: right;
		}
		
		.pregunta-titulo { 
			color: darkgreen;
		}
		
		.topicos { 
			color: dimgrey;
		}
		'.
]
