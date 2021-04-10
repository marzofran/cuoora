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
	self answer .
]

{ #category : #callbacks }
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
	aCanvas form
		class: 'answer-form';
		with: [ aCanvas heading level: 3; with: 'Responder a ' , (cuoora usuarioQueHizoPregunta: pregunta) nombre , ': '.
			(aCanvas textArea on: #descripcion of: self)
				class: 'answer-input';
				placeholder: 'Escriba su respuesta aqui';
				columns: 80;
				rows: 50.
			aCanvas submitButton
				class: 'answer-button floating-right';
				callback: [ self crearRespuesta ];
				with: 'Guardar'.
			aCanvas submitButton
				class: 'answer-button';
				callback: [ self cancelar ];
				with: 'Cancelar' ]
]
