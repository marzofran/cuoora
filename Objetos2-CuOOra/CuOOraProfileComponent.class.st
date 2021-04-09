Class {
	#name : #CuOOraProfileComponent,
	#superclass : #CuOOraPageComponent,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #construction }
CuOOraProfileComponent class >> conUsuario: unUsuario [
	^ self new initializeConUsuario: unUsuario
]

{ #category : #initialization }
CuOOraProfileComponent >> initializeConUsuario: unUsuario [
	usuario := unUsuario
]

{ #category : #rendering }
CuOOraProfileComponent >> renderFollowButtonOn: aCanvas [
	usuario == self session usuario
		ifFalse: [ aCanvas anchor
				class: 'floating-right';
				callback: [ self session usuario seguir: usuario ];
				with: [ aCanvas paragraph
						class: 'floating-button';
						with: 'Follow' ] ]
]

{ #category : #rendering }
CuOOraProfileComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
	aCanvas div
		class: 'like-dislike-buttons';
		with: [ aCanvas anchor
				callback: [ unaPregunta agregarLikeDe: self session usuario ];
				with: 'like'.
			aCanvas text: ' | '.
			aCanvas anchor
				callback: [ unaPregunta agregarDislikeDe: self session usuario ];
				with: 'dislike' ].
	aCanvas paragraph: (unaPregunta likes size asString) , ' likes | ' , (unaPregunta dislikes size asString) , ' dislikes'
]

{ #category : #rendering }
CuOOraProfileComponent >> renderNombreDe: unUsuario on: aCanvas [
	aCanvas anchor
		callback: [ self perfilDeUsuario: unUsuario ];
		with: [ aCanvas strong: unUsuario nombre ]
]

{ #category : #rendering }
CuOOraProfileComponent >> renderPageContentOn: aCanvas [
	self renderFollowButtonOn: aCanvas. 
	aCanvas heading with: 'Preguntas de ' , usuario nombre.
	aCanvas unorderedList
		with: [ usuario preguntas
				do: [ :each | self renderPregunta: each on: aCanvas ] ].
]

{ #category : #rendering }
CuOOraProfileComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas listItem
		class: 'pregunta';
		with: [
			aCanvas anchor 
			callback: [ self call: (CuOOraAllAnswersComponent conPregunta: unaPregunta) ];
			with: [aCanvas heading
				class: 'pregunta-titulo';
				level: 3;
				with: [ aCanvas emphasis: unaPregunta titulo ]].
			aCanvas paragraph class: 'topicos'; with: [aCanvas emphasis with: 'Tópicos: ' , (self topicosComoStringDe: unaPregunta) , '.'].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					self renderNombreDe: (cuoora usuarioQueHizoPregunta: unaPregunta) on: aCanvas.
					aCanvas
						text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ].
			self renderLikesDislikesDe: unaPregunta on: aCanvas ]
]
