import Vagones.*
import Locomotoras.*

object formacion {
	
	const formaciones = []
	const locomotoras = []
	
	method capacidadDeOasajerosDeFormacion(tipoDeVagon) = tipoDeVagon.capacidadDePasajeros()
	
	method capacidadDeOasajerosDeFormacion2() = formaciones.sum({v =>v.capacidadDePasajeros()}) 
	
	method cantidadDePopulares() = formaciones.count({v => v.esPopular()}) //se debe agregar a los vagones el metodo de si es popular.
	
	method recibeMantenimiento() = formaciones.forEach({v=>v.recibirMantenimiento()})
	
	method esFormacionCarguera() = formaciones.all({v => v.pesoMaximo() >= 1000})
	
	
	method vagonPesado() = formaciones.max({v => v.pesoMaximo()})
	method vagonMasLiviano() = formaciones.min({v=>v.pesoMaximo()})
	method dispersionDePeso() = self.vagonPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	
	method cantidadDeBanios() = formaciones.count({v => v.tieneBanio()})
	
	method vagonQueTieneMasPasajeros() = formaciones.max({v => v.capacidadDePasajeros()})
	method vagonQueTieneMenosPasajeros() = formaciones.min({v=>v.capacidadDePasajeros()})
	
	method estaEquilibrado() =
	 self.vagonQueTieneMasPasajeros().capacidadDePasajeros() -  self.vagonQueTieneMenosPasajeros().capacidadDePasajeros() <= 20
	
	method estaEquilibrada() {
		const pasajeros =self.vagonesSoloDePasajeros() 
		const maximo = pasajeros.max {f => f.capacidadDePasajeros() }
		const minimo = pasajeros.min {f => f.capacidadDePasajeros() }
		return maximo.capacidadDePasajeros() - minimo.capacidadDePasajeros() <= 20
	}
	method vagonesSoloDePasajeros() {
		return formaciones.filter { f => f.esDePasajeros()}
	}
	
	method estaOrganizada() {
		return not (1..formaciones.size()-1).any {
			idx => not formaciones.get(idx-1).esDePasajeros() and formaciones.get(idx).esDePasajeros()
		}
	}
	
	method locomotoraMasLenta() = locomotoras.min({l => l.velocidadMaxima()})	
	method velocdiadMaxima() = self.locomotoraMasLenta().velocidadMaxima()
	
	method esEficiente() = locomotoras.all({l=>l.esEficiente()})
	
	method pesoDeVagones() = formaciones.sum({v=>v.pesoMaximo()})
	method pesoDeLocomotoras() = formaciones.sum({v=>v.peso()})
	method puedeMoverse() = self.sumaDelArrastre() >= self.sumaDePesos()
	method sumaDelArrastre() = locomotoras.sum({l=>l.pesoArrastable()})
	method sumaDePesos() = self.pesoDeVagones() + self.pesoDeLocomotoras()
	
	
	method kilosQueFaltan() = 0.max(self.sumaDePesos() - self.sumaDelArrastre())

method vagonMasPesado() = formaciones.max({f=>f.pesoMaximo()})

method esCompleja() = self.unidadesDeLaFormacion() > 8 or self.sumaDePesos() > 80000

method unidadesDeLaFormacion() = formaciones.size() + locomotoras.size()
}

