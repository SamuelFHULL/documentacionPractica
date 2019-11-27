module Alimento
class PlatoB < PlatoA
	def initialize(nombre, lista_alimentos, lista_cantidades)
		super(nombre, lista_alimentos, lista_cantidades)
	end

	def emisionesGEI
		emisionesGEI = 0.0
		i = 0
		while i<@lista_alimentos.size do
			emisionesGEI += @lista_alimentos[i].gei
			i+=1
		end
		return emisionesGEI
	end

	def uso_terreno
                usoTerreno = 0.0
                i = 0
                while i<@lista_alimentos.size do
                        usoTerreno += @lista_alimentos[i].terreno
                        i+=1
                end
                return usoTerreno
        end


	
end
end
