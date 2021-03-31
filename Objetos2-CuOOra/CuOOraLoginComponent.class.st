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
		with: [ aCanvas
				paragraph: [ aCanvas textInput placeholder: 'Usuario'].
			aCanvas
				paragraph: [ aCanvas textInput placeholder: 'Contrasena'].
			aCanvas submitButton
				callback: [ self call: CuOOraHomeComponent new ];
				with: 'Iniciar Sesion' ]
]

{ #category : #updating }
CuOOraLoginComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
    anHtmlRoot addStyle: '
			.login-form { 
				margin: 150px;
			}
			
			input { 
				box-sizing: border-box;
				width:250px;
				padding:10px;
  				border-radius:10px;
			}
		'.
]
