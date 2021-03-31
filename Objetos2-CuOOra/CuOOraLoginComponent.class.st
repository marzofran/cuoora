Class {
	#name : #CuOOraLoginComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraLoginComponent >> renderContentOn: aCanvas [
	aCanvas heading level: 1; with: 'CuOOra'.
	aCanvas form
		class: 'login-form';
		with: [ 
			aCanvas heading level: 3; with: 'Bienvenido a CuOOra!'.
			aCanvas
				paragraph: [ aCanvas textInput placeholder: 'Usuario'].
			aCanvas
				paragraph: [ aCanvas textInput placeholder: 'Contrasena'].
			aCanvas submitButton
				class: 'submit-button';
				callback: [ self call: CuOOraHomeComponent new ];
				with: 'Iniciar Sesion' ]
]

{ #category : #updating }
CuOOraLoginComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
			body { 
				background-color: #9cc599;
				font-family: sans-serif;
			}

			hr { 
				height: 5px;
			}

			h1 { 
				font-weight: 500;
				font-size: 3rem;
			}

			.login-form { 
				text-align: center;
				background-color: #e8f1e7;
				margin: auto;
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
		'.
]
