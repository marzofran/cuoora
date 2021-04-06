Class {
	#name : #CuOOraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'topico',
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
		conTopicos:
			(OrderedCollection
				with: (cuoora agregarTopicoConNombre: topico conDescripcion: 'N/A'))
		deUsuario: self session usuario.
	descripcion := nil.
	titulo := nil.
	topico := nil
]

{ #category : #accessing }
CuOOraHomeComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CuOOraHomeComponent >> descripcion: anObject [
	descripcion := anObject
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
				paragraph: [ aCanvas label: 'Titulo: '.
					aCanvas textInput on: #titulo of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'Descripcion: '.
					(aCanvas textArea on: #descripcion of: self)
						columns: 80;
						rows: 5;
						class: 'descripcion-input' ].
			aCanvas
				paragraph: [ aCanvas label: 'Topico: '.
					aCanvas textInput on: #topico of: self ].
			aCanvas submitButton
				class: 'submit-button';
				callback: [ self crearPregunta ];
				with: 'Crear!' ]
]

{ #category : #rendering }
CuOOraHomeComponent >> renderContentOn: aCanvas [
	self renderCuOOraHeaderOn: aCanvas.
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
		with: [ aCanvas heading: 'CuOOra'.
			aCanvas paragraph
				class: 'floating-right';
				with: [ aCanvas strong: self session usuario nombre.
					aCanvas space.
					aCanvas anchor
						callback: [ self answer ];
						with: 'Log out' ] ].
]

{ #category : #rendering }
CuOOraHomeComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
	aCanvas anchor
		callback: [ unaPregunta agregarLikeDe: self session usuario ];
		with: unaPregunta likes size asString , ' likes'.
	aCanvas text: ' | '.
	aCanvas anchor
		callback: [ unaPregunta agregarDislikeDe: self session usuario ];
		with: unaPregunta dislikes size asString , ' dislikes'
]

{ #category : #rendering }
CuOOraHomeComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas listItem
		class: 'pregunta';
		with: [ 
			aCanvas heading
				level: 3;
				with: [ aCanvas emphasis: unaPregunta titulo ].
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
CuOOraHomeComponent >> topico [
	^ topico
]

{ #category : #accessing }
CuOOraHomeComponent >> topico: anObject [
	topico := anObject
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
