#require "alimentos/version"

#module Alimentos
 # class Error < StandardError; end
  class Alimento
	  attr_reader :nombre
	  def initialize(nombre)
		  @nombre = nombre
	  end
  end
#end


carne = Alimento.new("carne")
puts carne.nombre
