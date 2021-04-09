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
CuOOraQuestionComponent >> renderAnswersOn: aCanvas [
	self subclassResponsibility 
]

{ #category : #rendering }
CuOOraQuestionComponent >> renderPageContentOn: aCanvas [
	aCanvas renderAnswersOn: aCanvas.
]
