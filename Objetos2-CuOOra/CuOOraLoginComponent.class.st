"
| application |
application := WAAdmin register: CuOOraLoginComponent  asApplicationAt: 'cuoora'.
application sessionClass: CuOOraSession.
"
Class {
	#name : #CuOOraLoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombre',
		'contrasena'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #accessing }
CuOOraLoginComponent >> contrasena [
	^ contrasena
]

{ #category : #accessing }
CuOOraLoginComponent >> contrasena: anObject [
	contrasena := anObject
]

{ #category : #callbacks }
CuOOraLoginComponent >> iniciarSesion [
	(self model usuarioConNombre: nombre conContrasena: contrasena)
		ifNotNil: [ :eseUsuario | self iniciarSesionCon: eseUsuario ].
	nombre := nil.
	contrasena := nil
]

{ #category : #private }
CuOOraLoginComponent >> iniciarSesionCon: unUsuario [
	self session usuario: unUsuario.
	self call: CuOOraHomeComponent new
]

{ #category : #accessing }
CuOOraLoginComponent >> model [
	^ CuOOra soleInstance 
]

{ #category : #accessing }
CuOOraLoginComponent >> nombre [
	^ nombre
]

{ #category : #accessing }
CuOOraLoginComponent >> nombre: anObject [
	nombre := anObject
]

{ #category : #rendering }
CuOOraLoginComponent >> renderContentOn: aCanvas [
	aCanvas heading level: 1; with: 'CuOOra'.
	aCanvas form
		class: 'login-form';
		with: [ 
			aCanvas heading level: 3; with: 'Bienvenido a CuOOra!'.
			aCanvas
				paragraph: [ aCanvas textInput placeholder: 'Usuario'; on: #nombre of: self].
			aCanvas
				paragraph: [ aCanvas passwordInput placeholder: 'Contrasena'; on: #contrasena of: self].
			aCanvas submitButton
				class: 'submit-button';
				callback: [ self iniciarSesion ];
				with: 'Iniciar Sesion' ].
	aCanvas paragraph: 'Sesiones: pedro@cuoora.com, diego@cuoora.com, juan@cuoora.com'
]

{ #category : #updating }
CuOOraLoginComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot
		addStyle:
			'
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
			margin-left: 20px;
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
		'
]
