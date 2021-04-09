Class {
	#name : #CuOOraAllAnswersComponent,
	#superclass : #CuOOraQuestionComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderAnswersOn: aCanvas [
		aCanvas anchor
		callback: [ self call: (CuOOraNewAnswerComponent conPregunta: pregunta) ];
		with: [ aCanvas submitButton
				class: 'new-answer-button';
				with: 'Agregar Respuesta' ].
]
