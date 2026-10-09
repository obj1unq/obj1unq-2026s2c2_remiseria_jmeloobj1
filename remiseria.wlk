class Torino{
 const property capacidad = 4 
 const property transportaSillaDeRuedas = false
 const property motorEsRuidoso = true
 var property color = "color"  
 var property vMax = 120 + "km/h"
 var property autonomia =  200 + "km"

}

class Economico {
var property capacidad = self.capacidadTotal()
var property transportaSillaDeRuedas = adaptaciones.contains(transportadorParaSillaDeRuedas)
const property motorEsRuidoso = self.tieneAdaptacionSilenciosa()
const property color = "Beige"
var property vMax = self.vMaxAdaptaciones() + "km/h"
var property adaptaciones = #{} 
var property autonomia = 200 + self.autonomiaConAdaptaciones() + "km"

method tieneAdaptacionSilenciosa() {
  return adaptaciones.contains(cañoDeEscapeSilencioso) || adaptaciones.contains(tanqueExtraDeGas)
}

method capacidadTotal() {
  return 5 - self.capacidadConAdaptaciones().size()
}

method capacidadConAdaptaciones() {
  return if(adaptaciones.contains(cañoDeEscapeSilencioso)){
    adaptaciones.copyWithout(cañoDeEscapeSilencioso)
}
else{
    adaptaciones
}
}

method vMaxAdaptaciones() {
  return if(!adaptaciones.isEmpty()){
     adaptaciones.min(adaptaciones.map({adaptacion => adaptacion.vMax()}))
  }
  else{
    vMax
  }
}

method autonomiaConAdaptaciones(){
  return if (!adaptaciones.isEmpty()){
    adaptaciones.sum({adaptacion => adaptacion.autonomia()}) 
     }
    }
}

object cañoDeEscapeSilencioso {
  method vMax() {
    return 115
  }
  method autonomia() {
    return -10
  }
}

object transportadorParaSillaDeRuedas{
    method vMax() {
    return 90
  }
  method autonomia() {
    return -20
  }
}

object tanqueExtraDeGas{
    method vMax() {
    return 80
  }
   method autonomia() {
    return 200
  }
}

object combiAdaptable{
  const property color = "Celeste" 
  var property interior = interiorEspacioso
  var property motor = deportivo
  var property autonomia = motor.autonomia() 
  var property motorEsRuidoso = motor.motorEsRuidoso() 
  var property capacidad = interior.capacidad() 
  var property transportaSillaDeRuedas = interior.transportaSillaDeRuedas()
  
}

object deportivo {
  method autonomia() {
    return 400 + "km"
  }

  method vMax() {
    return 230 + "km/h"
  }

  method motorEsRuidoso() {
    return true
  }
}

object urbano {
   method autonomia() {
    return 1000 + "km"
  }
    method vMax() {
    return 130 + "km/h"
  }

  method motorEsRuidoso() {
    return false
  }
}


object interiorEspacioso {
  method capacidad() {
    7
  }
  method transportaSillaDeRuedas() = false
}

object interiorAccesible {
  method capacidad() {
    5
  }
  method transportaSillaDeRuedas() = true
}