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
				paragraph: [ aCanvas label: 'Usuario: '.
					aCanvas space.
					aCanvas textInput ].
			aCanvas
				paragraph: [ aCanvas label: 'Contrasena: '.
					aCanvas space.
					aCanvas textInput ].
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
				width:200px;
  				padding:20px;
				box-sizing: border-box;
			}
		'.
]
