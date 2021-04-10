Class {
	#name : #CuOOraAllAnswersComponent,
	#superclass : #CuOOraQuestionComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderAnswersOn: aCanvas [
		aCanvas unorderedList: [ self respuestas do: [ :each | self renderRespuesta: each On: aCanvas ] ].
		aCanvas text: 'No hay mas respuestas'.
		aCanvas anchor
		callback: [ self call: (CuOOraNewAnswerComponent conPregunta: pregunta) ];
		with: [ aCanvas submitButton
				class: 'new-answer-button';
				with: 'Agregar Respuesta' ].
]

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderRespuesta: unaRespuesta On: aCanvas [

aCanvas listItem
		class: 'respuesta';
		with: [
			aCanvas
				paragraph: [ aCanvas text: 'Respuesta de ',
					(unaRespuesta nombreUsuario).
					aCanvas paragraph: [ aCanvas  
						text: unaRespuesta descripcion ]].
			self renderLikesDislikesDe: unaRespuesta on: aCanvas ]

]

{ #category : #accessing }
CuOOraAllAnswersComponent >> respuestas [

 ^ (pregunta respuestas sort: [ :r1 :r2 | r1 puntajeLikes >= r2 puntajeLikes ])
]
