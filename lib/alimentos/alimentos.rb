class Alimento
	attr_reader :nombre, :gei
	def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		@nombre = nombre
		@proteinas = proteinas
		@carbohidratos = carbohidratos
		@gei = gei
	end
end
