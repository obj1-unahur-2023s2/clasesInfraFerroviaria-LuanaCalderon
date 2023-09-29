import Vagones.*
import Locomotoras.*
import Formaciones.*

class Depositos {
	
	const  locomotoras = []
	const formaciones = []
	
	method vagonMasPesado() = formaciones.map({x=>x.vagonMasPesado()}).asSet()
	
	method necesitaConductorExerimentado() = formaciones.any({x=>x.esCompleja()})
	
	method agregarLocomotora() {}
	
	
	
}
