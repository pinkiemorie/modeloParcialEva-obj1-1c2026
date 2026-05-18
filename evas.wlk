object eva01 {
    var fuerzaAT = 2110
    var energia = 100

    method fuerzaAT() = fuerzaAT
    method puedeSincronizarCon(piloto) = piloto.puntosEntrenamiento() >= 4 and energia > 30
    method puntosQueOtorga() = 2

    method sincronizarCon(piloto) {
        if (self.puedeSincronizarCon(piloto)) {
            fuerzaAT = 2150.min(fuerzaAT + 1)
            energia -= 25
        }
    }

    method recargarEnergia(horas) {
        energia = 100.min(energia + horas * 30)
    }
}


object eva02 {
    var energia = 100
    var modoCombate = estandar

    method fuerzaAT() = 2114
    method puedeSincronizarCon(piloto) = piloto.puntosEntrenamiento() >= 2 and energia > 20
    method puntosQueOtorga() = modoCombate.puntosASumar()

    method sincronizarCon(piloto) {
        if (self.puedeSincronizarCon(piloto)) {
            energia -= modoCombate.energiaAConsumir()
        }
    }

    method recargarEnergia(horas) {
        energia = 100.min(energia + horas * 25)
    }

    method cambiarModoCombate(modoACambiar) {
        modoCombate = modoACambiar
    }
}


object estandar {
    method energiaAConsumir() = 10
    method puntosASumar() = 1
}


object ataque {
    method energiaAConsumir() = 20
    method puntosASumar() = 3
}


object berserk {
    method energiaAConsumir() = 35
    method puntosASumar() = 6
}


object eva00 {
    var fuerzaAT = 2100
    
    method fuerzaAT() = fuerzaAT
    method puntosQueOtorga() = 1

    method sincronizarCon(piloto) { }

    method mejorarFuerza(fuerzaAAgregar) {
        fuerzaAT = 2150.min(fuerzaAT + fuerzaAAgregar)
    }
}