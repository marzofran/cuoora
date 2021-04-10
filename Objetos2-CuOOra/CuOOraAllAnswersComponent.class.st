Class {
	#name : #CuOOraAllAnswersComponent,
	#superclass : #CuOOraQuestionComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #rendering }
CuOOraAllAnswersComponent >> renderAnswersOn: aCanvas [
	aCanvas orderedList:[
		(pregunta respuestas )
		sort: [ :r1 :r2 | r1 puntajeLikes >= r2 puntajeLikes  ]].
		aCanvas anchor
		callback: [ self call: (CuOOraNewAnswerComponent conPregunta: pregunta) ];
		with: [ aCanvas submitButton
				class: 'new-answer-button';
				with: 'Agregar Respuesta' ].
]
