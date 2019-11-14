class Alimento
	attr_reader :nombre, :gei, :terreno
	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@lipidos = lipidos
		@gei = gei
		@terreno = terreno
	end
	def to_s
		"Nombre: #{@nombre}.\nProteinas: #{@proteinas}\nCarbohidratos: #{@carbohidratos}\nLipidos: #{@lipidos}\nGEI: #{@gei}\nTerreno: #{@terreno}"
	end
		
end

carne_de_vaca = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0,164.0)
puts carne_de_vaca.to_s
