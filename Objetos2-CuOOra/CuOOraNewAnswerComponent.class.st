Class {
	#name : #CuOOraNewAnswerComponent,
	#superclass : #CuOOraQuestionComponent,
	#instVars : [
		'descripcion'
	],
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #callbacks }
CuOOraNewAnswerComponent >> cancelar [
	descripcion := nil.
	self answer
]

{ #category : #callbacks }
CuOOraNewAnswerComponent >> crearRespuesta [
	descripcion = ''
		ifFalse: [ pregunta
				agregarRespuestaDe: self session usuario
				conDescripcion: descripcion.
			descripcion := nil.
			self answer ]
]

{ #category : #accessing }
CuOOraNewAnswerComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
CuOOraNewAnswerComponent >> descripcion: unaDescripcion [
	descripcion := unaDescripcion
]

{ #category : #rendering }
CuOOraNewAnswerComponent >> renderAnswersOn: aCanvas [
	aCanvas form
		class: 'answer-form';
		with: [ aCanvas heading level: 3; with: 'Responder a ' , (self model usuarioQueHizoPregunta: pregunta) nombre , ': '.
			(aCanvas textArea on: #descripcion of: self)
				class: 'answer-input';
				placeholder: 'Escriba su respuesta aqui';
				columns: 80;
				rows: 50.
			aCanvas submitButton
				class: 'submit-button floating-right';
				callback: [ self crearRespuesta ];
				with: 'Guardar'.
			aCanvas submitButton
				class: 'submit-button';
				callback: [ self cancelar ];
				with: 'Cancelar' ]
]
