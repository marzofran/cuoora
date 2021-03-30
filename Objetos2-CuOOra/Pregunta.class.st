Class {
	#name : #Pregunta,
	#superclass : #Participacion,
	#instVars : [
		'titulo',
		'respuestas',
		'topicos'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #construction }
Pregunta class >> conTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos [
	^ (self conDescripcion: unaDescripcion )
	initializeConTitulo: unTitulo conTopicos: unosTopicos 
]

{ #category : #testing }
Pregunta >> agregarRespuesta: unaRespuesta [
	
	respuestas add: unaRespuesta 
]

{ #category : #'adding/removing' }
Pregunta >> agregarRespuestaDe: unUsuario conDescripcion: unaDescripcion [
	respuestas add:( Respuesta conDescripcion: unaDescripcion conUsuario: unUsuario )
]

{ #category : #'adding/removing' }
Pregunta >> borrarRespuestas [
	respuestas removeAll 
]

{ #category : #queries }
Pregunta >> esDeTopico: unTopico [
	^ topicos includes: unTopico
]

{ #category : #initialization }
Pregunta >> initialize [
	super initialize.
	respuestas := OrderedCollection new.
]

{ #category : #initialization }
Pregunta >> initializeConTitulo: unTitulo conTopicos: unosTopicos [
	titulo := unTitulo.
	topicos := unosTopicos 
]

{ #category : #queries }
Pregunta >> puntos [
	^ 20
]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas sort: [ :r1 :r2 | r1 puntajeLikes >= r2 puntajeLikes]
]

{ #category : #queries }
Pregunta >> respuestasDe: unUsuario [
	^ (respuestas collect: [ :unaRespuesta | unaRespuesta esDeUsuario: unUsuario])
]
