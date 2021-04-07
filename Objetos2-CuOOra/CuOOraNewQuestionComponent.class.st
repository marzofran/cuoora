Class {
	#name : #CuOOraNewQuestionComponent,
	#superclass : #WAComponent,
	#instVars : [
		'topicos',
		'titulo',
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
CuOOraNewQuestionComponent >> crearPregunta [

	CuOOra soleInstance
		agregarPreguntaConTitulo: titulo
		conDescripcion: descripcion
		conTopicos: (self generarTopicosDesde: topicos)
		deUsuario: self session usuario.
	descripcion := nil.
	titulo := nil.
	topicos := nil
]

{ #category : #accessing }
CuOOraNewQuestionComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CuOOraNewQuestionComponent >> descripcion: anObject [
	descripcion := anObject
]

{ #category : #formatting }
CuOOraNewQuestionComponent >> generarTopicosDesde: unString [

	^ ((unString splitOn: ',') collect: [ :substring | substring trimBoth ]) collect: [ :unNombre |  CuOOra soleInstance agregarTopicoConNombre: unNombre conDescripcion: 'n/a' ]
]

{ #category : #rendering }
CuOOraNewQuestionComponent >> renderContentOn: aCanvas [
	aCanvas render: CuOOraHeaderComponent new.
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

{ #category : #accessing }
CuOOraNewQuestionComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
CuOOraNewQuestionComponent >> titulo: anObject [
	titulo := anObject
]

{ #category : #accessing }
CuOOraNewQuestionComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
CuOOraNewQuestionComponent >> topicos: anObject [
	topicos := anObject
]

{ #category : #updating }
CuOOraNewQuestionComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot
		addStyle:'
			
		body { 
			font-family: sans-serif;
			background-color: #9cc599;
		}
		
		h1 { 
			font-weight: 500;
			font-size: 3rem;
			margin-left: 20px;
		}
		
		.floating-right { 
			float: right;
			margin-right: 20px;
		}
		
		a { 
			text-decoration: none;
			color: darkgreen;
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
		
		'
]
