Class {
	#name : #CuOOraPageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'header',
		'children'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
CuOOraPageComponent >> children [
	^ Array with: header.
]

{ #category : #initialization }
CuOOraPageComponent >> initialize [
	super initialize.
	cuoora := CuOOra soleInstance.
	header := CuOOraHeaderComponent conParent: self.
]

{ #category : #callbacks }
CuOOraPageComponent >> perfilDeUsuario: unUsuario [
	self call: (CuOOraProfileComponent conUsuario: unUsuario).
]

{ #category : #rendering }
CuOOraPageComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	self renderPageContentOn: aCanvas
]

{ #category : #rendering }
CuOOraPageComponent >> renderPageContentOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #handling }
CuOOraPageComponent >> return [
	( self isMemberOf: CuOOraHomeComponent) ifFalse: [ self answer ]
]

{ #category : #queries }
CuOOraPageComponent >> topicosComoStringDe: unaPregunta [
	
	^ String streamContents: [ :stream | (unaPregunta topicos collect: [ :unTopico | unTopico nombre ]) asStringOn: stream delimiter: ', '. ]
]

{ #category : #updating }
CuOOraPageComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
		body { 
			font-family: sans-serif;
			background-color: darkseagreen;
		}

		h1 { 
			font-weight: 500;
			font-size: 3rem;
			margin-left: 20px;
		}
		
		a { 
			text-decoration: none;
			color: darkgreen;
		}
		
		.floating-right { 
			float: right;
			margin-right: 20px;
		}
		
		.floating-button { 
			font-size: 1.5rem;
			margin-top: 30px;
			color: darkgreen;
		}
		
		ul {
			list-style-type: none;
			margin: 30px auto;
    		padding-inline-start: 0px;
			width: 90%;
		}
		
		.pregunta {
			background: white;
			margin-horizontal: auto;
			margin-top: 10px;
			border-radius: 10px;
			padding: 10px 20px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
		
		.respuesta {
			background: darkseagreen;
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
		
		.question-form {
			margin: 20px auto;
			width: 90%;
			background: white;
			border-radius: 10px;
			margin: 10px auto;
			padding: 20px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
		
		.answer-form {
			margin: 20px auto;
			width: 90%;
			background: darkseagreen;
			border-radius: 10px;
			margin: 10px auto;
			padding: 20px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
		
		.answer-input { 
			height: 100px;
			width: 97%;
			margin: auto;
			border-radius:10px;
			padding: 10px;
			resize: none;
		}
		
		
		.submit-button { 
			color: white;
			background-color: #64a460;
			width: 45%;
			margin: 10px;
		}
			
		.floating-center {
		 	margin: 20px;
			width: 30%;
			display: block;
			margin-left: auto;
    		margin-right: auto;
		text-align: center;
		}
			
		input { 
			box-sizing: border-box;
			width: 50%;
			padding:10px;
			border-radius:10px;
		}
		
		.descripcion-input { 
			height: 200px;
			width: 98%;
			margin: 0px auto;
			border-radius:10px;
			resize: none;
			padding: 10px;
		}
		
		.pregunta-content { 
			margin-horizontal: auto;
			margin-top: 10px;
			border-radius: 10px;
			padding: 10px 20px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
		}
		
		.separate { 
			margin: 30px;
		}
		'.
]
