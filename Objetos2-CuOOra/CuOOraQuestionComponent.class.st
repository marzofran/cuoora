Class {
	#name : #CuOOraQuestionComponent,
	#superclass : #CuOOraPageComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #construction }
CuOOraQuestionComponent class >> conPregunta: unaPregunta [
	^ self new initializeConPregunta: unaPregunta 
]

{ #category : #initialization }
CuOOraQuestionComponent >> initializeConPregunta: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #rendering }
CuOOraQuestionComponent >> renderAnswersOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #rendering }
CuOOraQuestionComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
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
CuOOraQuestionComponent >> renderNombreDe: unUsuario on: aCanvas [
	aCanvas anchor
		callback: [ self perfilDeUsuario: unUsuario ];
		with: [ aCanvas strong: unUsuario nombre ]
]

{ #category : #rendering }
CuOOraQuestionComponent >> renderPageContentOn: aCanvas [
	aCanvas div
		class: 'pregunta';
		with: [ aCanvas heading
				class: 'pregunta-titulo';
				level: 3;
				with: [ aCanvas emphasis: pregunta titulo ].
			aCanvas paragraph
				class: 'topicos';
				with: [ aCanvas emphasis
						with: 'Tópicos: ' , (self topicosComoStringDe: pregunta) , '.' ].
			aCanvas div
				class: 'pregunta-content';
				with: [ aCanvas paragraph: pregunta descripcion ].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					self
						renderNombreDe: (cuoora usuarioQueHizoPregunta: pregunta)
						on: aCanvas.
					aCanvas
						text: ' | ' , pregunta respuestas size asString , ' respuestas' ].
			self renderLikesDislikesDe: pregunta on: aCanvas.
			aCanvas horizontalRule.
			self renderAnswersOn: aCanvas ]
]
