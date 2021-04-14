Class {
	#name : #CuOOraHomeComponent,
	#superclass : #CuOOraPageComponent,
	#category : #'Objetos2-CuOOra-UI'
}

{ #category : #queries }
CuOOraHomeComponent >> preguntasVisibles [
	| preguntas |
	preguntas := (model preguntasRelevantesDe: self session usuario)
		sort: [ :p1 :p2 | p1 fechaYHora <= p2 fechaYHora ].
	^ OrderedCollection
		withAll:
			(preguntas
				select: [ :unaPregunta | (preguntas indexOf: unaPregunta) <= 5 ])
]

{ #category : #rendering }
CuOOraHomeComponent >> renderLikesDislikesDe: unaPregunta on: aCanvas [
	aCanvas div
		class: 'like-dislike-buttons';
		with: [ aCanvas anchor
				callback: [ unaPregunta agregarLikeDe: self session usuario ];
				with: 'like'.
			aCanvas text: ' | '.
			aCanvas anchor
				callback: [ unaPregunta agregarDislikeDe: self session usuario ];
				with: 'dislike' ].
	aCanvas
		paragraph:
			unaPregunta likes size asString , ' likes | '
				, unaPregunta dislikes size asString , ' dislikes'
]

{ #category : #rendering }
CuOOraHomeComponent >> renderNombreDe: unUsuario on: aCanvas [
	aCanvas anchor
		callback: [ self perfilDeUsuario: unUsuario ];
		with: [ aCanvas strong: unUsuario nombre ]
]

{ #category : #rendering }
CuOOraHomeComponent >> renderPageContentOn: aCanvas [
	aCanvas anchor
		class: 'floating-right';
		callback: [ self call: CuOOraNewQuestionComponent new ];
		with: [ aCanvas paragraph
				class: 'floating-button';
				with: 'Hacer una nueva pregunta' ].
	aCanvas heading with: [ aCanvas strong: 'Últimas preguntas' ].
	aCanvas unorderedList
		with: [ self preguntasVisibles
				do: [ :each | self renderPregunta: each on: aCanvas ] ].
	aCanvas horizontalRule
]

{ #category : #rendering }
CuOOraHomeComponent >> renderPregunta: unaPregunta on: aCanvas [
	aCanvas listItem
		class: 'pregunta';
		with: [ aCanvas anchor
				callback: [ self call: (CuOOraAllAnswersComponent conPregunta: unaPregunta) ];
				with: [ aCanvas heading
						class: 'pregunta-titulo';
						level: 3;
						with: [ aCanvas emphasis: unaPregunta titulo ] ].
			aCanvas paragraph
				class: 'topicos';
				with: [ aCanvas emphasis
						with: 'Tópicos: ' , (self topicosComoStringDe: unaPregunta) , '.' ].
			aCanvas
				paragraph: [ aCanvas text: 'Realizada por '.
					self
						renderNombreDe: (model usuarioQueHizoPregunta: unaPregunta)
						on: aCanvas.
					aCanvas
						text: ' | ' , unaPregunta respuestas size asString , ' respuestas' ].
			self renderLikesDislikesDe: unaPregunta on: aCanvas ]
]

{ #category : #handling }
CuOOraHomeComponent >> return [
	"This method does nothing at all"
]
