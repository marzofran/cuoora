Class {
	#name : #CuOOraLoginComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraLoginComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas
		form: [ aCanvas
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
