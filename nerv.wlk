object nerv {
    const evas = []
    const pilotos = []

    method evas() = evas
    method puedenSincronizarse(piloto, eva) = piloto.puedeSincronizarCon(eva) and eva.puedeSincronizarCon(piloto)
    method promedioPuntosEntrenamiento() = pilotos.forEach({p => p.puntosEntrenamiento()}).average()
    method mayorPuntosEntrenamiento() = pilotos.find(pilotos.max({p => p.puntosEntrenamiento()}))
    method valoresFuerzaATEnCuartel() = evas.map({e => e.fuerzaAT()})
    method puedeSincronizarseCon(piloto) = evas.filter({e => self.puedenSincronizarse(piloto, e)})
    method todosPilotosPuedenUsarUnEva() = pilotos.all({p => self.puedeAlgunEvaSincronizarCon(p)})
    method puedeAlgunEvaSincronizarCon(piloto) = evas.any({e => self.puedenSincronizarse(piloto, e)})

    method registrarPiloto(piloto) {
        pilotos.add(piloto)
    }

    method quitarPiloto(piloto) {
        pilotos.remove(piloto)
    }

    method registrarEva(eva) {
        pilotos.add(eva)
    }

    method quitarEva(eva) {
        pilotos.remove(eva)
    }

    method intentarSincronizacion(piloto, eva) {
        if (self.puedenSincronizarse(piloto, eva)) {
            piloto.sincronizarCon(eva)
            eva.sincronizarCon(piloto)
        }
    }

    method sincronizarConTodosLosEvas(piloto) {
        evas.forEach({e => self.intentarSincronizacion(piloto, e)})
    }
}