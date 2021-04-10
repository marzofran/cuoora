Class {
	#name : #CuOOraAllAnswersComponent,
	#superclass : #CuOOraQuestionComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderAnswersOn: aCanvas [
		aCanvas unorderedList: [ self respuestas do: [ :each | self renderRespuesta: each On: aCanvas ] ].
		aCanvas paragraph class: 'floating-center'; with: 'No hay mas respuestas'.
		aCanvas horizontalRule.
		aCanvas anchor
		callback: [ self call: (CuOOraNewAnswerComponent conPregunta: pregunta) ];
		with: [ aCanvas submitButton
				class: 'floating-center submit-button';
				with: 'Agregar Respuesta' ].
]

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderRespuesta: unaRespuesta On: aCanvas [
	aCanvas listItem
		class: 'respuesta';
		with: [ aCanvas
				paragraph: [ aCanvas strong: 'Respuesta de '.
					self renderNombreDe: unaRespuesta usuario on: aCanvas ].
			aCanvas paragraph: [ aCanvas text: unaRespuesta descripcion ].
			self renderLikesDislikesDe: unaRespuesta on: aCanvas ]
]

{ #category : #accessing }
CuOOraAllAnswersComponent >> respuestas [

 ^ (pregunta respuestas sort: [ :r1 :r2 | r1 puntajeLikes >= r2 puntajeLikes ])
]
