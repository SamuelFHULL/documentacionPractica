require 'alimentos'
RSpec.describe Alimentos do
  
  before :all do
    @carne_vaca = Alimento::Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
    @carne_cordero = Alimento::Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
    @camarones = Alimento::Alimento.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
    @chocolate = Alimento::Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @salmon = Alimento::Alimento.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
    @cerdo = Alimento::Alimento.new("cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
    @pollo = Alimento::Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
    @queso = Alimento::Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
    @cerveza = Alimento::Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
    @leche_vaca = Alimento::Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
    @huevos = Alimento::Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
    @cafe = Alimento::Alimento.new("Cafe", 0.1, 0.0, 0.0, 0.4, 3.4)
    @tofu = Alimento::Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
    @lentejas = Alimento::Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
    @nuez = Alimento::Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
    
    @lista_alimentos = [@cafe,@leche_vaca, @huevos, @pollo, @tofu, @nuez, @cerveza, @salmon, @carne_vaca]
    @lista_cantidades = [2,4,3,7,10,2,7,4,6]

  end

  #it "has a version number" do
  context "Existencia de variables de instancia" do
  it "Existe un nombre de alimento" do
	  expect(@carne_vaca.instance_variable_defined?("@nombre")).to eq(true)
  end
  it "Existe cantidad de gases de efecto invernadero" do
	  expect(@carne_vaca.instance_variable_defined?("@gei")).to eq(true)
  end
  it "Existe cantidad de terreno utilizado" do
	  expect(@carne_vaca.instance_variable_defined?("@terreno")).to eq(true)
  end
  end
  context "Se puede acceder a las variables de instancia" do
  it "Existe un metodo para obtener el nombre del alimento" do
	  expect(@carne_vaca.nombre).to eq("Carne de vaca")	  
  end
  it "Existe un metodo para obtener las emisiones de gases de efecto invernadero" do
	  expect(@carne_vaca.gei).to eq(50.0)
  end
  it "Existe un método para obtener el terreno utilizado" do
	  expect(@carne_vaca.terreno).to eq(164.0)
  end
  end
  it "Existe un metodo para obtener el alimento formateado" do
	  expect(@carne_vaca.to_s).to eq("Nombre: Carne de vaca.\nProteinas: 21.1\nCarbohidratos: 0.0\nLipidos: 3.1\nGEI: 50.0\nTerreno: 164.0")
  end
  it "Existe un metodo para obtener valor energetico del alimento"do
	  expect(@carne_vaca.valorEnergetico).to eq(112.3)
  end

  it "Existe metodo impacto ambiental" do
	  expect(@carne_vaca.impactoAmbiental(@lista_alimentos, @lista_cantidades,0)).to eq(1559.7199999999998)
  end

  context "Se pueden comparar alimentos segun su eficiencia energetica" do
    it "Existe metodo para comparar que un alimento sea menor que otro" do
      expect(@cafe<@carne_vaca).to eq(true)
    end
    it "Existe un metodo para comprobar que un alimento es mayor que otro" do
      expect(@carne_vaca > @cafe).to eq(true)
    end
    it "Existe metodo para comprobar que un alimento es menor o igual que otro" do
      expect(@cafe <= @carne_vaca).to eq(true)
    end
    it "Existe metodo para comprobar que un alimento es >= que otro" do
      expect(@carne_vaca >= @cafe).to eq(true)
    end
    it "Existe metodo para comprobar que un alimento es igual a otro" do
      expect(@carne_vaca == @cafe).to eq(false)
    end
    it "Existe metodo para comprobar que un alimento es distinto de otro" do
      expect(@carne_vaca != @cafe).to eq(true)
    end
  end
 

  

  describe "Lista" do
    before :all do
      @lista_test = Alimento::Lista.new
    end
    context "Existe clase Lista" do
      it "Se puede hacer new" do
        l1 = Alimento::Lista.new
      end
     end
	context "Variables de instancia de la lista" do
	  it "Tiene cabeza" do
            expect(@lista_test.instance_variable_defined?("@head")).to eq(true)
	  end
	  it "Tiene cola" do
            expect(@lista_test.instance_variable_defined?("@tail")).to eq(true)
	  end
	    
	end
	context "metodos de instancia de la lista" do
	  it "se puede meter un elemento en la lista" do
	    expect(@lista_test.size()).to eq(0)
	    @lista_test.insert_head(@carne_vaca)
	    expect(@lista_test.size()).to eq(1)
	  end
	  it "se pueden insertar varios elementos en la lista" do
	    @lista_test.insert_head(@cafe)
	    @lista_test.insert_head(@tofu)
	    @lista_test.insert_head(@nuez)
	    expect(@lista_test.size()).to eq(4)
	  end
	  
	  it "se puede eliminar el primer elemento de la lista" do
	    @lista_test.extract_head
	    expect(@lista_test.size()).to eq(3)
	  end
	  it "se puede eliminar el ultimo elemento" do
	    @lista_test.extract_tail
	    expect(@lista_test.size).to eq(2)
	  end
	end
	context "dietas" do
	  before :all do
	    #Dieta española
            @dieta_espanola = Alimento::Lista.new
	    @dieta_espanola.insert_head(@carne_vaca)
            @dieta_espanola.insert_head(@cafe)
            @dieta_espanola.insert_head(@leche_vaca)
            @dieta_espanola.insert_head(@queso)
            @dieta_espanola.insert_head(@cerveza)
            @dieta_espanola.insert_head(@nuez)

	    #Dieta locura por la carne
	    @dieta_locura = Alimento::Lista.new
	    @dieta_locura.insert_head(@pollo)
	    @dieta_locura.insert_head(@cerveza)
	    @dieta_locura.insert_head(@carne_vaca)
	    @dieta_locura.insert_head(@cafe)
	    @dieta_locura.insert_head(@carne_cordero)
	    @dieta_locura.insert_head(@nuez)

	    #Dieta vasca
	    @dieta_vasca = Alimento::Lista.new
	    @dieta_vasca.insert_head(@lentejas)
	    @dieta_vasca.insert_head(@nuez)
	    @dieta_vasca.insert_head(@chocolate)
	    @dieta_vasca.insert_head(@queso)
	    @dieta_vasca.insert_head(@huevos)
	    @dieta_vasca.insert_head(@carne_vaca)


	  end

	  it "Emisiones diarias de gases de efecto invernadero" do
	    sumGEIesp = 0
	    sumGEIloc = 0
	    sumGEIvasca = 0
	    cont = 0
            auxEsp = @dieta_espanola.head
	    auxLoc = @dieta_locura.head
	    auxVasca = @dieta_vasca.head
	    while cont < @dieta_espanola.size do
	      sumGEIesp += auxEsp.value.gei.round(4)
	      sumGEIloc += auxLoc.value.gei.round(4)
	      sumGEIvasca += auxVasca.value.gei.round(4)
	      auxEsp = auxEsp.next
	      auxLoc = auxLoc.next
	      auxVasca = auxVasca.next
	      cont += 1
            end

	    expect(sumGEIesp.round(2)).to eq(65.14)
	    expect(sumGEIloc.round(2)).to eq(76.64)
	    expect(sumGEIvasca.round(2)).to eq(68.2)

	  end
	  it "Emisiones anuales de GEI" do
	    sumGEIanualEsp = 0
	    sumGEIanualLoc = 0
	    sumGEIanualVasca = 0
	    cont = 0
	    auxEsp = @dieta_espanola.head
	    auxLoc = @dieta_locura.head
	    auxVasca = @dieta_vasca.head
	    while cont < @dieta_espanola.size do
	      sumGEIanualEsp += auxEsp.value.gei.round(4)
	      sumGEIanualLoc += auxLoc.value.gei.round(4)
	      sumGEIanualVasca += auxVasca.value.gei.round(4)
	      auxEsp = auxEsp.next
	      auxLoc = auxLoc.next
	      auxVasca = auxVasca.next
	      cont += 1
	    end
	    sumGEIanualEsp *= 365
	    sumGEIanualLoc *= 365
	    sumGEIanualVasca *= 365

	    expect(sumGEIanualEsp.round(2)).to eq(23776.1)
	    expect(sumGEIanualLoc.round(2)).to eq(27973.6)
	    expect(sumGEIanualVasca.round(2)).to eq(24893.0)
	  end
	  it "Uso terreno para la dieta" do
	    terrenoEsp = 0
	    terrenoLoc = 0
	    terrenoVasca = 0
	    cont = 0
	    auxEsp = @dieta_espanola.head
	    auxLoc = @dieta_locura.head
	    auxVasca = @dieta_vasca.head
	    while cont < @dieta_espanola.size do
	      terrenoEsp += auxEsp.value.terreno
	      terrenoLoc += auxLoc.value.terreno
	      terrenoVasca += auxVasca.value.terreno
	      auxEsp = auxEsp.next
	      auxLoc = auxLoc.next
	      auxVasca = auxVasca.next
	      cont+=1
	    end
	    expect(terrenoEsp.round(2)).to eq(225.42)
	    expect(terrenoLoc.round(2)).to eq(367.62)
	    expect(terrenoVasca.round(2)).to eq(225.4)
	  end
	end
	context "Las listas se pueden enumerar" do
	  before :each do
	    @lista_enumerable = Alimento::Lista.new
	    @lista_enumerable.insert_head(@pollo)
	    @lista_enumerable.insert_head(@tofu)
	    @lista_enumerable.insert_head(@carne_vaca)
	    @lista_enumerable.insert_head(@cerveza)

	  end
	  it "se puede hacer collect" do
	    expect(@lista_enumerable.collect {|x| x}).to eq([@cerveza, @carne_vaca, @tofu, @pollo])
	  end
	  it "se puede hacer select" do
            expect(@lista_enumerable.select {|x| x.valorEnergetico}).to eq([@cerveza, @carne_vaca, @tofu, @pollo])
	  end
	  it "se puede hacer max" do
            expect(@lista_enumerable.max).to eq(@pollo)
	  end
	  it "se puede hacer min" do
	    expect(@lista_enumerable.min).to eq(@cerveza)
	  end
	  it "se puede hacer sort" do
            expect(@lista_enumerable.sort {|a,b| a<=>b}).to eq([@cerveza, @tofu, @carne_vaca, @pollo])
	  end
	end
	
   end

  describe "Node" do
    before :each do
      @nodo1 = Alimento::Node.new(@carne_vaca,nil,nil)
    end
    context "Estructura Nodo" do
      it "Existe la estructura nodo" do
        n1 = Alimento::Node.new(@carne_vaca,nil,nil)
      end
      it "Existe un nodo con sus datos, siguiente y previo" do
        expect(@nodo1.next).to be(nil)
        expect(@nodo1.value).to eq(@carne_vaca)
	expect(@nodo1.prev).to be(nil)
      end
    end
  end
  describe "PlatoA" do
    before :each do
      @lista_alimentos1 = Alimento::Lista.new
      @lista_alimentos1.insert_head(@salmon)
      @lista_alimentos1.insert_head(@lentejas)
      @lista_alimentos1.insert_head(@carne_vaca)
      @lista_alimentos1.insert_head(@cafe)
      @lista_cantidades1 = Alimento::Lista.new
      @lista_cantidades1.insert_head(1)
      @lista_cantidades1.insert_head(2)
      @lista_cantidades1.insert_head(1)
      @lista_cantidades1.insert_head(3)
      @plato1 = Alimento::PlatoA.new("plato1", @lista_alimentos1, @lista_cantidades1)   
    end
    context "Obtener atributos de plato" do
      it "Se puede obtener el nombre del plato" do
        expect(@plato1.nombre).to eq("plato1")
      end
    end
    context "Existen variables de instancias" do
      it "Existe el conjunto de alimentos" do
        expect(@plato1.instance_variable_defined?("@lista_alimentos")).to eq(true)
      end
      it "Existe el conjunto de cantidades" do
        expect(@plato1.instance_variable_defined?("@lista_cantidades")).to eq(true)
      end
    end
    context "porcentajes" do
      it "porcentaje de proteinas del conjunto de alimentos" do
        expect(@plato1.por_proteinas).to eq(41.69)
      end
      it "porcentaje de carbohidratos del conjunto de alimentos" do
        expect(@plato1.por_carbohidratos).to eq(49.1)
      end
      it "porcentaje de lipidos del conjunto de alimentos" do
	      expect(@plato1.por_lipidos).to eq(9.21)
      end
    end
    context "Valor calórico del plato" do
      it "se accede al VCT del conjunto de alimentos en kcal" do
	      expect(@plato1.valor_energetico).to eq(629.3)
      end
    end
    context "Métodos para imprimir platos" do
      it "obtener conjunto de alimentos formateado" do
	      expect(@plato1.to_s).to eq("Cafe -> 3 Carne de vaca -> 1 Lentejas -> 2 Salmon -> 1 ")
      end
    end
    end
  describe "PlatoB" do
    before :each do
      @lista_alimentos2 = Alimento::Lista.new
      @lista_alimentos2.insert_head(@salmon)
      @lista_alimentos2.insert_head(@lentejas)
      @lista_alimentos2.insert_head(@carne_vaca)
      @lista_alimentos2.insert_head(@cafe)
      @lista_cantidades2 = Alimento::Lista.new
      @lista_cantidades2.insert_head(1)
      @lista_cantidades2.insert_head(2)
      @lista_cantidades2.insert_head(1)
      @lista_cantidades2.insert_head(3)
      @plato2 = Alimento::PlatoB.new("plato2", @lista_alimentos2, @lista_cantidades2)

      @lista_alimentos3 = Alimento::Lista.new
      @lista_alimentos3.insert_head(@salmon)
      @lista_alimentos3.insert_head(@lentejas)
      @lista_alimentos3.insert_head(@carne_vaca)
      @lista_alimentos3.insert_head(@pollo)
      @lista_cantidades3 = Alimento::Lista.new
      @lista_cantidades3.insert_head(1)
      @lista_cantidades3.insert_head(2)
      @lista_cantidades3.insert_head(1)
      @lista_cantidades3.insert_head(3)
      @plato3 = Alimento::PlatoB.new("plato3", @lista_alimentos3, @lista_cantidades3)

    end
    context "Impacto ambiental" do
      it "Gases GEI diarios" do
        expect(@plato2.emisionesGEI).to eq(56.8)
      end
      it "Uso terreno" do
	      expect(@plato2.uso_terreno).to eq(174.5)
      end
      it "Eficiencia energetica formateada" do
	      expect(@plato2.to_s).to eq("Energia Cafe -> 0.4 Energia Carne de vaca -> 112.3 Energia Lentejas -> 314.6 Energia Salmon -> 202.0  || Energia Total -> 629.3 ")
      end
    end
    context "tipos platos" do
      it "comprobar que pertenece a una clase" do
        expect(@plato2.instance_of? Alimento::PlatoB).to eq(true)
      end
      it "comprobar que es un tipo de plato" do
        expect(@plato2.is_a? Alimento::PlatoA).to eq(true)
      end

    end
    context "Platos comparables" do
      it "Existe metodo para comparar que un alimento sea menor que otro" do
        expect(@plato2<@plato3).to eq(true)
      end
      it "Existe un metodo para comprobar que un alimento es mayor que otro" do
        expect(@plato3 > @plato2).to eq(true)
      end
      it "Existe metodo para comprobar que un alimento es menor o igual que otro" do
        expect(@plato2 <= @plato3).to eq(true)
      end
      it "Existe metodo para comprobar que un alimento es >= que otro" do
        expect(@plato3 >= @plato2).to eq(true)
      end
      it "Existe metodo para comprobar que un alimento es igual a otro" do
        expect(@plato3 == @plato2).to eq(false)
      end
      it "Existe metodo para comprobar que un alimento es distinto de otro" do
        expect(@plato2 != @plato3).to eq(true)
      end
    end

    context "los platos son enumerables" do
          before :each do
            @lista_platos = Alimento::Lista.new
            @lista_platos.insert_head(@plato1)
            @lista_platos.insert_head(@plato2)
	    @lista_platos.insert_head(@plato3)

          end
          it "se puede hacer collect" do
            expect(@lista_platos.collect {|x| x}).to eq([@plato3, @plato2, @plato1])
          end
=begin
          it "se puede hacer select" do
            expect(@lista_platos.select {|x| x==@plato1}).to eq([@plato1])
          end
          it "se puede hacer max" do
            expect(@lista_platos.max).to eq(@plato3)
          end
          it "se puede hacer min" do
            expect(@lista_platos.min).to eq(@plato1)
          end

          it "se puede hacer sort" do
            expect(@lista_platos.sort {|a,b| a<=>b}).to eq([@plato1, @plato2, @plato3])
          end
=end
        end


    end

    describe "menu dietetico" do
      before :each do
	#Crear plato principal
	@listaAlimentosPlatoPrincipal = Alimento::Lista.new
        @listaCantidadesPlatoPrincipal = Alimento::Lista.new
	@listaAlimentosPlatoPrincipal.insert_head(@lentejas)
	@listaAlimentosPlatoPrincipal.insert_head(@salmon)
	@listaAlimentosPlatoPrincipal.insert_head(@queso)
        @listaCantidadesPlatoPrincipal.insert_head(2)
	@listaCantidadesPlatoPrincipal.insert_head(3)
	@listaCantidadesPlatoPrincipal.insert_head(1)
	@platoPrincipal = Alimento::PlatoB.new("Plato principal", @listaAlimentosPlatoPrincipal, @listaCantidadesPlatoPrincipal)
	#Crear segundo plato
	@listaAlimentosSegundoPlato = Alimento::Lista.new
	@listaCantidadesSegundoPlato = Alimento::Lista.new
	@listaAlimentosSegundoPlato.insert_head(@pollo)
	@listaAlimentosSegundoPlato.insert_head(@carne_vaca)
	@listaAlimentosSegundoPlato.insert_head(@cerdo)
	@listaCantidadesSegundoPlato.insert_head(3)
	@listaCantidadesSegundoPlato.insert_head(1)
	@listaCantidadesSegundoPlato.insert_head(2)
	@segundoPlato = Alimento::PlatoB.new("Segundo plato", @listaAlimentosSegundoPlato, @listaCantidadesSegundoPlato)
	#Crear postre
	@listaAlimentosPostre = Alimento::Lista.new
	@listaCantidadesPostre = Alimento::Lista.new
	@listaAlimentosPostre.insert_head(@cafe)
	@listaAlimentosPostre.insert_head(@leche_vaca)
	@listaAlimentosPostre.insert_head(@nuez)
	@listaCantidadesPostre.insert_head(2)
	@listaCantidadesPostre.insert_head(1)
	@listaCantidadesPostre.insert_head(3)
	@postre = Alimento::PlatoB.new("Postre",@listaAlimentosPostre, @listaCantidadesPostre)

	@menuDietetico = [@platoPrincipal, @segundoPlato, @postre]
	@preciosMenu = [40,60,20]

      end
      context "Pruebas usando paradigma de programacion funcional" do
        it "huella nutricional maxima del menu" do
		expect(@menuDietetico.collect {|x| x.huella_nutricional}.max).to eq(2.0)
	end
	it "Incrementar precios de los platos" do
          @huellaNutricionalMax = @menuDietetico.collect{|x| x.huella_nutricional}.max
	  @porcentaje = 0.0
	  if @huellaNutricionalMax < 2
            @porcentaje = 0.10
	  elsif @huellaNutricionalMax >= 5
            @porcentaje = 0.30
	  else
	    @porcentaje = 0.20
	  end
	  @preciosModificados = @preciosMenu.collect{|x| x += x*@porcentaje}
	end
      end
    end
   end






