Class {
	#name : #CuOOraHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'header'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #hooks }
CuOOraHomeComponent >> children [ 
	^ Array with: header
]

{ #category : #initialization }
CuOOraHomeComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance.
	header := CuOOraHeaderComponent new.
	 
	
]

{ #category : #callbacks }
CuOOraHomeComponent >> logout [
    self session unregister. 
    self requestContext redirectTo: self application url
]

{ #category : #queries }
CuOOraHomeComponent >> preguntasVisibles [
	| preguntas |
	preguntas := (cuoora preguntasRelevantesDe: (self session usuario))
		sort: [ :p1 :p2 | p1 fechaYHora <= p2 fechaYHora ].
	^ OrderedCollection withAll: (preguntas select: [ :unaPregunta | (preguntas indexOf: unaPregunta) <= 5 ])
]

{ #category : #rendering }
CuOOraHomeComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	"self renderCuOOraHeaderOn: aCanvas."
	aCanvas anchor
		class: 'floating-right';
		callback: [ self call: CuOOraNewQuestionComponent new ];
		with: [ aCanvas paragraph
				class: 'nueva-pregunta-button';
				with: 'Hacer una nueva pregunta' ].
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas unorderedList
		with: [ self preguntasVisibles
				do: [ :each | self renderPregunta: each on: aCanvas ] ].
	aCanvas horizontalRule
]

{ #category : #rendering }
CuOOraHomeComponent >> renderCuOOraHeaderOn: aCanvas [
	aCanvas div
		with: [ aCanvas paragraph
				class: 'floating-right';
				with: [ 
					self renderNombreDe: self session usuario on: aCanvas.
					aCanvas space.
					aCanvas anchor
						callback: [ self logout ];
						with: 'Log out' ].
			aCanvas heading: 'CuOOra'.
			aCanvas horizontalRule ]
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
CuOOraHomeComponent >> renderNombreDe: unUsuario on: aCanvas [
	aCanvas anchor
		callback: [ self call: (CuOOraProfileComponent conUsuario: unUsuario) ];
		with: [ aCanvas strong: unUsuario nombre ]
]

{ #category : #rendering }
CuOOraHomeComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas listItem
		class: 'pregunta';
		with: [ 
			aCanvas anchor with:
			[aCanvas heading
				class: 'pregunta-titulo';
				level: 3;
				with: [ aCanvas emphasis: unaPregunta titulo ]].
			aCanvas paragraph class: 'topicos'; with: [aCanvas emphasis with: 'Tópicos: ' , (self topicosComoStringDe: unaPregunta) , '.'].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					self renderNombreDe: (cuoora usuarioQueHizoPregunta: unaPregunta) on: aCanvas.
					aCanvas
						text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ].
			self renderLikesDislikesDe: unaPregunta on: aCanvas ]

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
			color: darkgreen;
		}
		
		a { 
			text-decoration: none;
			color: darkgreen;
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
			
		.pregunta { 
			background-color: #e8f1e7;
			background: white;
			margin-horizontal: auto;
			margin-top: 10px;
			border-radius: 10px;
			padding: 10px 20px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
		
		.like-dislike-buttons { 
			float: right;
		}
		
		.topicos { 
			color: dimgrey;
		}
		'.
]
