#require "alimentos/version"

#module Alimentos
 # class Error < StandardError; end
  class Alimento
	  attr_reader :nombre
	  def initialize(nombre, proteinas, carbohidratos, lipidos, gei, terreno)
		  @nombre = nombre
		  @proteinas = proteinas
		  @carbohidratos = carbohidratos
		  

	  end
  end
#end
