module Alimento
#Clase PlatoB que hereda de Plato padre (PlatoA)
class PlatoB < PlatoA
	#Constructor de la clase PlatoB
	def initialize(nombre, lista_alimentos, lista_cantidades)
		super(nombre, lista_alimentos, lista_cantidades)
	end
        #Metodo que calculas las emisiones de los GEI de un plato
	def emisionesGEI
		emisionesGEI = 0.0
		i = 0
		while i<@lista_alimentos.size do
			emisionesGEI += @lista_alimentos[i].gei
			i+=1
		end
		return emisionesGEI
	end
        #Metodo que calcula el uso de terreno de un plato
	def uso_terreno
                usoTerreno = 0.0
                i = 0
                while i<@lista_alimentos.size do
                        usoTerreno += @lista_alimentos[i].terreno
                        i+=1
                end
                return usoTerreno
        end
        #Metodo que imprime el plato formateado
	def to_s 
		cadena = ""
		i = 0
		valorEtotal = 0.0
		while i< @lista_alimentos.size do
			cadena+= "Energia #{@lista_alimentos[i].nombre} -> #{@lista_alimentos[i].valorEnergetico} "
			valorEtotal+= @lista_alimentos[i].valorEnergetico
			i+=1
		end
		cadena+= " || Energia Total -> #{valorEtotal} "
		return cadena
	end
	#Metodo que calcula la huella nutricional de un plato
	def huella_nutricional
          indiceImpactoEnergia, indiceImpactoCarbono = 0
          if valor_energetico < 670
	    indiceImpactoEnergia = 1.0
	  elsif valor_energetico > 830
	    indiceImpactoEnergia = 3.0
	  else
	    indiceImpactoEnergia = 2.0
         	   
	  end

	  if emisionesGEI < 800
	    indiceImpactoCarbono = 1.0
	  elsif emisionesGEI > 1200
            indiceImpactoCarbono = 3.0
	  else
            indiceImpactoCarbono = 2.0
	  end

	  return (indiceImpactoEnergia + indiceImpactoCarbono) / 2.0


	
end
end
end
