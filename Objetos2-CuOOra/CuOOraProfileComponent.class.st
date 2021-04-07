Class {
	#name : #CuOOraProfileComponent,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'cuoora'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #construction }
CuOOraProfileComponent class >> conUsuario: unUsuario [
	^ self new initializeConUsuario: unUsuario
]

{ #category : #initialization }
CuOOraProfileComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance 
]

{ #category : #initialization }
CuOOraProfileComponent >> initializeConUsuario: unUsuario [
	usuario := unUsuario
]

{ #category : #callbacks }
CuOOraProfileComponent >> perfilDeUsuario: unUsuario [
	self call: (CuOOraProfileComponent conUsuario: unUsuario).
]

{ #category : #rendering }
CuOOraProfileComponent >> renderContentOn: aCanvas [
	aCanvas render: CuOOraHeaderComponent new.
	aCanvas heading with: 'Preguntas de ' , usuario nombre.
	aCanvas unorderedList
		with: [ usuario preguntas
				do: [ :each | self renderPregunta: each on: aCanvas ] ].
]

{ #category : #rendering }
CuOOraProfileComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
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
CuOOraProfileComponent >> renderNombreDe: unUsuario on: aCanvas [
	aCanvas anchor
		callback: [ self perfilDeUsuario: unUsuario ];
		with: [ aCanvas strong: unUsuario nombre ]
]

{ #category : #rendering }
CuOOraProfileComponent >> renderPregunta: unaPregunta on: aCanvas [
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
CuOOraProfileComponent >> topicosComoStringDe: unaPregunta [
	
	^ String streamContents: [ :stream | (unaPregunta topicos collect: [ :unTopico | unTopico nombre ]) asStringOn: stream delimiter: ', '. ]
]

{ #category : #updating }
CuOOraProfileComponent >> updateRoot: anHtmlRoot [
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
