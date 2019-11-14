class Alimento
	attr_reader :nombre, :gei, :terreno
	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@gei = gei
		@terreno = terreno
	end
end
