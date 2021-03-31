Class {
	#name : #CuOOraLoginComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraLoginComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas horizontalRule.
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
				with: 'INICIAR SESION' ]
]

{ #category : #updating }
CuOOraLoginComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
			body { 
				background-color: #69FFCA;
			}

			hr { 
				height: 5px;
			}

			.login-form { 
				text-align: center;
				margin: auto;
				width: 30%;
				background: white;
				border-radius: 10px;
				padding: 10px;
				box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
			}
			
			.submit-button { 
				color: white;
				background-color: #7BB964;
			}
			
			input { 
				box-sizing: border-box;
				width: 100%;
				padding:10px;
  				border-radius:10px;
			}
		'.
]
