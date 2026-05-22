object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuado {

  var nutrientes = []

  method agregarNutriente(nutriente) {
    nutrientes.add(nutriente)
  }

  method rendimientoQueOtorga(dosisConsumida) {
    return nutrientes.sum() * dosisConsumida / 1000
  }
}



object aguaSaborizada {

  var bebida = whisky

  method bebida(bebidaNueva) {
    bebida = bebidaNueva
  }

  method rendimientoQueOtorga(dosisConsumida) {
    return 1 + bebida.rendimientoQueOtorga(dosisConsumida / 4)
  }
}



object coctel {

  var bebidas = []

  method agregarBebida(unaBebida) {
    bebidas.add(unaBebida)
  }

  method rendimientoQueOtorga(dosisConsumida) {

    return bebidas.fold(1) { acumulado, bebida ->
      acumulado * bebida.rendimientoQueOtorga(dosisConsumida / bebidas.size())
    }
  }
}