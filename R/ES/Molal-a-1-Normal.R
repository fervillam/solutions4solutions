
  # Descargar el paquete necesario para hacer más fácil determinar las masas atómicas

    if(!require("PeriodicTable")){
      install.packages("PeriodicTable")
    }
      library(PeriodicTable)

      #Ejemplo de función para masas atómicas con PeriodicTable

        mass("C") #masa atómica del carbono
        # [1] 12.0107

        # Ejemplo de suma de masas atómicas: la fórmula molecular de la glucosa es C6H12O6.
        #¿Cuál es su masa molar?

        6*mass("C") + 12*mass("H") + 6*mass("O")
        # [1] 180.1559


  # Función para convertir una solución de cualquier molalidad a una de 1 Normal        

  molal.a.1norm <- function(x, densidadsoluto, densidadsolvente, equivalentesoluto, masamolarsoluto)
                {
                  molal <- x
                  kgsolvente <- 1
                  molsoluto <- molal*kgsolvente
                  Lsolvente <- ((kgsolvente*1000)/(densidadsolvente))/1000
                  Lsoluto <- ((molsoluto*masamolarsoluto)/densidadsoluto)/1000
                  Lsolucion <- Lsolvente + Lsoluto
                  Molaridad <- molsoluto/Lsolucion
                  Normalidad <- Molaridad*equivalentesoluto
                  Volumenfinal <- (Normalidad*Lsolucion)/1
                  Deltavolumen <- (Volumenfinal - Lsolucion)*1000

                  outputmassolvente <- paste0("Agregar ", Deltavolumen, ", mL de solvente")

                    if(Deltavolumen>0){
                      print(paste0("Agregar ", Deltavolumen, " mL de solvente"))
                    }

                    if(Deltavolumen<0){
                      molfinal <- (1*Volumenfinal)/equivalentesoluto
                      deltamol <- 1 - molfinal
                      deltagramo <- deltamol*masamolarsoluto


                      print(paste0("Agregar ", deltagramo, " g de soluto"))
                    } else{
                      print(paste0("La solución no necesita ningún cambio"))

                }
  }
