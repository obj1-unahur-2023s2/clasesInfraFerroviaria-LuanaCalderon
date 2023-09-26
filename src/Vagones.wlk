class VagonDePasajeros {
	
	var property tieneBanio = true
	var property estaOrdnado = true
	var property largo = 0
	var property ancho = 0
	
	
	method capacidad() = if (ancho <= 3) { 8 * largo } else { 10 * largo }
	
	method capacidadPasajeros() =
	if(!estaOrdnado) {self.capacidad() - 15} else {self.capacidad()}
	
	method cargaMaxima() = if(!tieneBanio) {800} else {300}
	
	method pesoMaximo() = 2000 + 800 * self.capacidadPasajeros() + self.cargaMaxima()
}

