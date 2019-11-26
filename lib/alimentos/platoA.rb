module Alimento
class PlatoA
	attr_reader :nombre
	def initialize (nombre, lista_alimentos, lista_cantidades)
		@nombre = nombre
		@lista_alimentos = lista_alimentos
		#@lista_cantidades = lista_cantidades
	end
end
end
