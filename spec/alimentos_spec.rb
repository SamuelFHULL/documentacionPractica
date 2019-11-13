require 'alimentos'
RSpec.describe Alimentos do
  
  before :all do
    @carne_vaca = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
  end

  it "has a version number" do
    expect(Alimentos::VERSION).not_to be nil
  end
  it "Existe un nombre de alimento" do
	  @carne_vaca.instance_variable_defined?("@nombre")
  end
  
  it "La clase alimento tiene un nombre" do
	  expect(@carne_vaca.nombre).to eq("Carne de vaca")	  
  end
  it "Existe gases de efecto invernadero" do
	  expect(@carne_vaca.gei).to eq(50.0)
  end
end
