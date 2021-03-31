Class {
	#name : #Participacion,
	#superclass : #Object,
	#instVars : [
		'descripcion',
		'fechaYHora',
		'likes',
		'dislikes'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #construction }
Participacion class >> conDescripcion: unaDescripcion [ 
	^ self new initializeConDescripcion: unaDescripcion
]

{ #category : #'adding/removing' }
Participacion >> agregarDislikeDe: unUsuario [
	self borrarLikeDe: unUsuario.
	dislikes detect: [ :unDislike | unDislike esDeUsuario: unUsuario]
	ifNone: [dislikes add: (Interaccion conUsuario: unUsuario)].
]

{ #category : #'adding/removing' }
Participacion >> agregarLikeDe: unUsuario [
	self borrarDislikeDe: unUsuario.
	likes detect: [ :unLike | unLike esDeUsuario: unUsuario]
	ifNone: [likes add: (Interaccion conUsuario: unUsuario)].
]

{ #category : #'adding/removing' }
Participacion >> borrarDislikeDe: unUsuario [
	dislikes detect:[ :unDislike | unDislike esDeUsuario: unUsuario]
	ifFound: [ :elDislike | dislikes remove: elDislike ].
]

{ #category : #'adding/removing' }
Participacion >> borrarLikeDe: unUsuario [
	likes detect:[ :unLike | unLike esDeUsuario: unUsuario]
	ifFound: [ :elLike | likes remove: elLike ].
]

{ #category : #accessing }
Participacion >> descripcion [
	^ descripcion
]

{ #category : #accessing }
Participacion >> dislikes [
	^ dislikes
]

{ #category : #accessing }
Participacion >> fechaYHora [
	^ fechaYHora
]

{ #category : #initialization }
Participacion >> initialize [ 
	likes := OrderedCollection new.
	dislikes := OrderedCollection new.
	fechaYHora := DateAndTime now
]

{ #category : #initialization }
Participacion >> initializeConDescripcion: unaDescripcion [
	descripcion := unaDescripcion 
]

{ #category : #accessing }
Participacion >> likes [
	^ likes
]

{ #category : #queries }
Participacion >> puntajeLikes [
	^ likes size - dislikes size
]

{ #category : #queries }
Participacion >> puntos [
	self subclassResponsibility
]
