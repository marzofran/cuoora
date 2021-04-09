Class {
	#name : #CuOOraNewAnswerComponent,
	#superclass : #CuOOraQuestionComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #initialization }
CuOOraNewAnswerComponent >> initialize: unaPregunta [

	pregunta := unaPregunta. 
]

{ #category : #initialization }
CuOOraNewAnswerComponent >> initializeConPregunta: unaPregunta [

	pregunta := unaPregunta. 
]

{ #category : #rendering }
CuOOraNewAnswerComponent >> renderContentOn: aCanvas [
	aCanvas render: header.
	aCanvas form: [  ]
]

{ #category : #rendering }
CuOOraNewAnswerComponent >> renderPreguntaOn: aCanvas [

[aCanvas heading
				class: 'pregunta-titulo';
				level: 3;
				with: [ aCanvas emphasis: pregunta titulo ]].
			aCanvas paragraph class: 'topicos'; with: [aCanvas emphasis with: 'Tópicos: ' , (self topicosComoStringDe: pregunta) , '.'].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					self renderNombreDe: (cuoora usuarioQueHizoPregunta: pregunta) on: aCanvas.]
]
