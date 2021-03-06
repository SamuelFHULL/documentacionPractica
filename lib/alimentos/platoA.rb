module Alimento
#Clase plato que representa una lista de alimentos junto con sus cantidades
class PlatoA
	include Comparable
	attr_reader :nombre
	#Constructor de la clase PlatoA
	def initialize (nombre, lista_alimentos, lista_cantidades)
		@nombre = nombre
		@lista_alimentos = lista_alimentos
		@lista_cantidades = lista_cantidades
	end
	#Metodo que devuelve el porcentaje de proteinas de un plato
	def por_proteinas
		aux_proteinas = 0.0
		i = 0
		while i < @lista_alimentos.size do
			aux_proteinas += @lista_alimentos[i].proteinas * @lista_cantidades[i]
			i+=1
		end
		return ((aux_proteinas/total_nutrientes)*100.0).round(2) 
	end
	#Metodo que devuelve el porcentaje de carbohidratos de un plato
	def por_carbohidratos
        	aux_carbohidratos = 0.0
		i = 1
	       	while i < @lista_alimentos.size do
			aux_carbohidratos += @lista_alimentos[i].carbohidratos * @lista_cantidades[i]
			i+=1
		end
		return ((aux_carbohidratos/total_nutrientes)*100.0).round(2)
	end
	#Metodo que devuelve el porcentaje de lipidos de un plato
	def por_lipidos
		aux_lipidos = 0.0
		i = 1
		while i < @lista_alimentos.size do
			aux_lipidos += @lista_alimentos[i].lipidos * @lista_cantidades[i]
			i+=1
		end
		return ((aux_lipidos/total_nutrientes)*100.0).round(2)
	end
	#Metodo que devuelve el valor energetico de un plato
	def valor_energetico
		i = 0
		valorC = 0.0
		while i< @lista_alimentos.size do
			valorC += @lista_alimentos[i].valorEnergetico
			i+=1
		end
		return valorC
	end
        #Metodo que calcula el total de nutrientes de un plato
	def total_nutrientes
		i = 0
		proteinas = carbohidratos = lipidos = 0.0
		while i < @lista_alimentos.size do
			proteinas += (@lista_alimentos[i].proteinas)*(@lista_cantidades[i])
			carbohidratos += (@lista_alimentos[i].carbohidratos)*(@lista_cantidades[i])
			lipidos += (@lista_alimentos[i].lipidos)*(@lista_cantidades[i])
		        i+= 1
		end
		return proteinas + lipidos + carbohidratos
	end
	#Metodo que imprime un plato formateado
	def to_s
		i=0
		cadena = ""
		while i<@lista_alimentos.size do
			cadena += "#{@lista_alimentos[i].nombre} -> #{@lista_cantidades[i]} "
			i += 1
		
		end
	
		return cadena
	end
	#metodo que pertenece al modulo comparable y que compara dos platos
	def <=>(otroPlato)
		return valor_energetico <=> otroPlato.valor_energetico
	end

end
end
