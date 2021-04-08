Class {
	#name : #CuOOraHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #constructor }
CuOOraHeaderComponent class >> conParent: unParent [
	^ self new initializeConParent: unParent
]

{ #category : #initialization }
CuOOraHeaderComponent >> initializeConParent: unParent [
	parent := unParent
]

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
						callback: [ parent perfilDeUsuario: self session usuario ];
						with: [ aCanvas strong: self session usuario nombre ].
					aCanvas space.
					aCanvas anchor
						callback: [ self logout ];
						with: 'Log out' ].
			aCanvas anchor
				callback: [ parent return ];
				with: [ aCanvas heading: 'CuOOra' ].
			aCanvas horizontalRule ]
]
