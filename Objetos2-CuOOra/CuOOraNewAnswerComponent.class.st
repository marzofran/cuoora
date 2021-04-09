Class {
	#name : #CuOOraNewAnswerComponent,
	#superclass : #CuOOraQuestionComponent,
	#instVars : [
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #'as yet unclassified' }
CuOOraNewAnswerComponent >> cancelar [

	descripcion := nil.
	self answer .
]

{ #category : #'as yet unclassified' }
CuOOraNewAnswerComponent >> crearRespuesta [

	pregunta agregarRespuestaDe: (self session usuario) conDescripcion: descripcion.
	descripcion := nil.
	self answer.
]

{ #category : #accessing }
CuOOraNewAnswerComponent >> descripcion [ 

^ descripcion
]

{ #category : #accessing }
CuOOraNewAnswerComponent >> descripcion: unaDescripcion [ 

descripcion := unaDescripcion .
]

{ #category : #rendering }
CuOOraNewAnswerComponent >> renderAnswersOn: aCanvas [

	aCanvas form: [ aCanvas label: 'RESPONDER'.
		aCanvas textInput placeholder: 'Escriba su respuesta aqui'; on: #descripcion of: self.
		aCanvas submitButton
				class: 'submit-button';
				callback: [ self crearRespuesta ];
				with: 'Guardar' .
			aCanvas submitButton 
			class: 'submit-button';
			callback: [ self cancelar ];
			with: 'Cancelar'.]
			
		 
	 
]
