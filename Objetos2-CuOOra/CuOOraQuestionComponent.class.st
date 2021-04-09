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
]

{ #category : #rendering }
CuOOraQuestionComponent >> renderPageContentOn: aCanvas [
	aCanvas anchor
		callback: [ self call: (CuOOraNewAnswerComponent conPregunta: pregunta) ];
		with: [ aCanvas submitButton
				class: 'new-answer-button';
				with: 'Agregar Respuesta' ]
]
