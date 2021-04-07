Class {
	#name : #CuOOraHeaderComponent,
	#superclass : #WAComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
CuOOraHeaderComponent >> logout [
    self session unregister. 
    self requestContext redirectTo: self application url
]

{ #category : #rendering }
CuOOraHeaderComponent >> renderContentOn: aCanvas [
	aCanvas div
		with: [ aCanvas paragraph
				class: 'floating-right';
				with: [ aCanvas anchor
						callback: [ self call: (CuOOraProfileComponent conUsuario: self session usuario) ];
						with: [ aCanvas strong: self session usuario nombre ].
					aCanvas space.
					aCanvas anchor
						callback: [ self logout ];
						with: 'Log out' ].
			aCanvas heading: 'CuOOra'.
			aCanvas horizontalRule ]
]
