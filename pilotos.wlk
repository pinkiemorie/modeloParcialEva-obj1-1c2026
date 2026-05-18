import evas.*
import nerv.*

object asuka {
    var puntosEntrenamiento = 5
    var ultimoEvaSincronizado = eva00

    method puntosEntrenamiento() = puntosEntrenamiento
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)
    method estaSatisfecha() = ultimoEvaSincronizado.fuerzaAT() > 2115

    method sincronizarCon(eva) { 
        ultimoEvaSincronizado = eva
        self.entrenar(eva.puntosQueOtorga())
    }

    method entrenar(puntosAAgregar) {
        puntosEntrenamiento += puntosAAgregar
    }
}

object shinji {
    var puntosEntrenamiento = 2
    const evasSincronizado = []
    var estaCansado = false

    method puntosEntrenamiento() = puntosEntrenamiento
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and not estaCansado
    method estaSatisfecha() = nerv.evas().all({e => evasSincronizado.contains(e)})

    method sincronizarCon(eva) { 
        evasSincronizado.add(eva)
        self.entrenar(eva.puntosQueOtorga())
        estaCansado = true
    }

    method descansar() {
        estaCansado = false
    }

    method entrenar(puntosAAgregar) {
        puntosEntrenamiento += puntosAAgregar
    }
}

object rei {
    var puntosEntrenamiento = 0
    var evasSincronizado = 0

    method puntosEntrenamiento() = puntosEntrenamiento
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.fuerzaAT() >= 2110 and evasSincronizado < 5
    method estaSatisfecha() = evasSincronizado > 0

    method sincronizarCon(eva) { 
        evasSincronizado += 1
        self.entrenar(eva.puntosQueOtorga())
    }

    method entrenar(puntosAAgregar) {
        puntosEntrenamiento += puntosAAgregar
    }
}