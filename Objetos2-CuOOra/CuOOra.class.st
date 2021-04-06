Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'preguntas',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-CuOOra-Model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [ 
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> notHardcoded [
	^ self new.
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new hardcodeModel ]
]

{ #category : #'adding/removing' }
CuOOra >> agregarPreguntaConTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos deUsuario: unUsuario [
	| p |
	p := Pregunta conTitulo: unTitulo conDescripcion: unaDescripcion conTopicos: unosTopicos.
	preguntas add: p.
	unUsuario agregarPregunta: p.
	^ p
	
]

{ #category : #'adding/removing' }
CuOOra >> agregarTopicoConNombre: unNombre conDescripcion: unaDescripcion [

	| nuevoTopico |	
	nuevoTopico := Topico conNombre: unNombre conDescripcion: unaDescripcion.
	topicos detect: [ :each | each nombre = (unNombre asLowercase) ]
	ifFound: [ :eseTopico | ^ eseTopico ]
	ifNone: [ ^ topicos add: nuevoTopico ]
]

{ #category : #'adding/removing' }
CuOOra >> borrarPregunta: unaPregunta [

	preguntas remove: unaPregunta.
	usuarios borrarPregunta: unaPregunta.
]

{ #category : #queries }
CuOOra >> calcularPuntaje: unUsuario [
	| misInteracciones |
	misInteracciones := (OrderedCollection withAll: unUsuario preguntas).
	misInteracciones addAll: (self respuestasDe: unUsuario).
	misInteracciones removeAllFoundIn: (unUsuario respuestasAMisPreguntas).
	^misInteracciones sumNumbers: [:interaccion | interaccion puntos + interaccion puntajeLikes ]
]

{ #category : #'adding/removing' }
CuOOra >> crearUsuarioConNombre: unNombre conContrasena: unaContrasena [
	| nuevoUsuario |
	nuevoUsuario := UsuarioCuOOra
		conNombre: unNombre
		conContrasena: unaContrasena.
	usuarios
		detect: [ :each | each nombre = unNombre ]
		ifFound: [ :eseUsuario | ^ eseUsuario ]
		ifNone: [ ^ usuarios add: nuevoUsuario ]
]

{ #category : #initialization }
CuOOra >> hardcodeModel [
	| topico1 topico2 topico3 usuarioPedro usuarioDiego usuarioJuan pregunta1 pregunta2 |
	usuarioPedro := self
		crearUsuarioConNombre: 'pedro@cuoora.com'
		conContrasena: 'pedro@cuoora.com'.
	usuarioDiego := self
		crearUsuarioConNombre: 'diego@cuoora.com'
		conContrasena: 'diego@cuoora.com'.
	usuarioJuan := self
		crearUsuarioConNombre: 'juan@cuoora.com'
		conContrasena: 'juan@cuoora.com'.
	usuarioJuan seguir: usuarioDiego.
	usuarioPedro seguir: usuarioJuan.
	topico1 := self
		agregarTopicoConNombre: 'OO1'
		conDescripcion: 'POO Supremacy'.
	topico2 := self
		agregarTopicoConNombre: 'Test de unidad'
		conDescripcion: 'Testing those units'.
	topico3 := self
		agregarTopicoConNombre: 'Smalltalk'
		conDescripcion: 'Lets have a chat'.
	pregunta1 := self
		agregarPreguntaConTitulo: '¿Para qué sirve el método SetUp?'
		conDescripcion:
			'No logro comprender la funcionalidad de este método, ¿alguien podría guiarme?'
		conTopicos: (OrderedCollection with: topico1 with: topico2)
		deUsuario: usuarioPedro.
	pregunta2 := self
		agregarPreguntaConTitulo: '¿Qué significa #messageNotUnderstood?'
		conDescripcion:
			'Obtengo este error cuando ejecuto mi programa, pero no se por qué. ¿Qué puede estar sucediendo?'
		conTopicos: (OrderedCollection with: topico1 with: topico3)
		deUsuario: usuarioDiego.
	pregunta1 agregarRespuestaDe: usuarioDiego conDescripcion: 'Sirve para instanciar los objetos que son evaluados por el test en un único método y que se ejecute siempre antes de cada test.'.
	pregunta2 agregarRespuestaDe: usuarioPedro conDescripcion: 'Significa que el objeto que recibió el mensaje no encontró ningún método para ejecutar en respuesta.'
]

{ #category : #initialization }
CuOOra >> initialize [ 
	preguntas := OrderedCollection new.
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new.
]

{ #category : #accessing }
CuOOra >> preguntas [
	^ preguntas
]

{ #category : #queries }
CuOOra >> preguntasDe: unTopico [

	^ preguntas select: [ :pregunta | pregunta esDeTopico: unTopico ]
]

{ #category : #queries }
CuOOra >> preguntasRelevantesDe: unUsuario [
	^ (unUsuario topicosFav
		flatCollect: [ :topico | self preguntasDe: topico ])
		union: (unUsuario following flatCollect: [ :follow | follow preguntas ])
]

{ #category : #queries }
CuOOra >> respuestasDe: unUsuario [

	^ (preguntas flatCollect: [ :pregunta | pregunta respuestasDe: unUsuario ])
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos
]

{ #category : #queries }
CuOOra >> usuarioConNombre: unNombre conContrasena: unaContrasena [
	^ usuarios
		detect:
			[ :unUsuario | unUsuario nombre = unNombre & (unUsuario contrasena = unaContrasena) ]
		ifNone: [ nil ]
]

{ #category : #queries }
CuOOra >> usuarioQueHizoPregunta: unaPregunta [
	^ usuarios detect: [ :unUsuario | unUsuario yoHice: unaPregunta ]
]

{ #category : #accessing }
CuOOra >> usuarios [

	^ usuarios
]
