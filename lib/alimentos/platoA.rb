module Alimento
class PlatoA
	attr_reader :nombre
	def initialize (nombre, lista_alimentos, lista_cantidades)
		@nombre = nombre
		@lista_alimentos = lista_alimentos
		@lista_cantidades = lista_cantidades
	end
	def por_proteinas
		aux_proteinas = 0.0
		i = 0
		while i < @lista_alimentos.size do
			aux_proteinas += @lista_alimentos[i].proteinas * @lista_cantidades[i]
			i+=1
		end
		return ((aux_proteinas/total_nutrientes)*100.0).round(2) 
	end
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
end
end
