// remiseria.wlk
class Torino {
  const property capacidad = 4
  const property transportaSillaDeRuedas = false
  const property motorEsRuidoso = true
  var property color = "color"
  var property vMax = 120
  var property autonomia = 200
}

class Economico {
  var property capacidad = self.capacidadTotal()
  var property transportaSillaDeRuedas = adaptaciones.contains(
    transportadorParaSillaDeRuedas
  )
  const property motorEsRuidoso = !self.tieneAdaptacionSilenciosa()
  const property color = "Beige"
  var property vMax = self.vMaxAdaptaciones()
  var property adaptaciones = #{}
  var property autonomia = 200 + self.autonomiaConAdaptaciones()
  
  method tieneAdaptacionSilenciosa() = adaptaciones.contains(
    tanqueExtraDeGas
  ) || adaptaciones.contains(cañoDeEscapeSilencioso)
  
  method capacidadTotal() = 5 - self.capacidadConAdaptaciones()
  
  method capacidadConAdaptaciones() = if (adaptaciones.contains(
                                          cañoDeEscapeSilencioso
                                        )) adaptaciones.size() - 1
                                      else adaptaciones.size()
  
  method vMaxAdaptaciones() = if (!adaptaciones.isEmpty()) adaptaciones.min(
                                  { adaptacion => adaptacion.vMax() }
                                ).vMax()
                              else 120
  
  method autonomiaConAdaptaciones() = adaptaciones.sum(
    { adaptacion => adaptacion.autonomia() }
  )
}

object cañoDeEscapeSilencioso {
  method vMax() = 115
  
  method autonomia() = -10
}

object transportadorParaSillaDeRuedas {
  method vMax() = 90
  
  method autonomia() = -20
}

object tanqueExtraDeGas {
  method vMax() = 80
  
  method autonomia() = 200
}

object combiAdaptable {
  const property color = "Celeste"
  var property interior = interiorAccesible
  var property motor = deportivo
  var property motorEsRuidoso = motor.motorEsRuidoso()
  var property vMax = motor.vMax()
  
  method capacidad() = interior.capacidad()
  
  method transportaSillaDeRuedas() = interior.transportaSillaDeRuedas()
  
  method vMax() = motor.vMax()
  
  method autonomia() = motor.autonomia()
  
  method motorEsRuidoso() = motor.motorEsRuidoso()
}

object deportivo {
  method autonomia() = 400
  
  method vMax() = 230
  
  method motorEsRuidoso() = true
}

object urbano {
  method autonomia() = 1000
  
  method vMax() = 130
  
  method motorEsRuidoso() = false
}

object interiorEspacioso {
  method capacidad() {
   return  7
  }
  
  method transportaSillaDeRuedas() = false
}

object interiorAccesible {
  method capacidad() {
   return 5
  }
  
  method transportaSillaDeRuedas() = true
}

class Reserva{
  var property cantidadPersonas = 0
  var property distanciaARecorrer = 0
  var property tiempoMaxDeViaje = 0 
  var property coloresContraindicados = #{}
  var property necesidadDeAutoSilencioso = true
  var property necesidadDeSillaDeRuedas = true  
  const property vPromedioDeViaje = (distanciaARecorrer / tiempoMaxDeViaje) + 10
method capacidadAptaDeVehiculo(vehiculo) {
  return vehiculo.capacidad() >= cantidadPersonas
  }

method autonomiaAptaDeVehiculo(vehiculo) {
  return vehiculo.autonomia() >= distanciaARecorrer
    }

    method vMaxAptaDeVehiculo(vehiculo) {
      vehiculo.vMax() >= vPromedioDeViaje
    }

    method colorAptoDeVehiculo(vehiculo) {
      vehiculo.color().notIn(coloresContraindicados)
    }

    method vehiculoAptoParaSillaDeRuedas(vehiculo) {
      return vehiculo.transportaSillaDeRuedas()
    }

    method vechiculoSilencioso(vehiculo) {
      return vehiculo.motorEsRuidoso()
    }
}