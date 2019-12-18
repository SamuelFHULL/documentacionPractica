module Alimento
#Estructura que representa un nodo
Node = Struct.new(:value, :next, :prev)
#Clase que representa una Lista enlazada
class Lista
  include Enumerable
  attr_reader :head, :tail, :size
  #Constructor de la clase lista
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  #Metodo para insertar un nodo por la cabeza
  def insert_head(value)
    nodo = Node.new(value,nil,nil)
    if @size == 0
      @tail = nodo
      nodo.next = nil
    else
      @head.prev = nodo
      nodo.next = @head
    end
    @size = @size + 1
    @head = nodo
    nodo.prev = nil

  end
  #Metodo para extraer un nodo por la cabeza
  def extract_head
    if @size != 0
      aux = @head
      if @size > 1
        @head.next.prev = nil
      else
        @tail = nil
      end      
      @head = @head.next
      @size = @size-1
      return aux
    else
      puts "La lista esta vacia"
    end
    
  end
  #Metodo para extraer un nodo por la cola
  def extract_tail
    if @size != 0
      aux = @tail
      if @size > 1
        @tail.prev.next = nil
      else
	@head = nil
      end
      @tail = @tail.prev
      @size = @size - 1
      return aux
    else
      puts "La lista esta vacia"
    end
  end
  #Metodo para seleccionar un nodo de la lista
  def each(&block)
    aux = @head
    while aux!=nil do
      yield aux.value
      aux = aux.next 
    end
  end
  #Operador corchete para acceder a un nodo de la lista
  def [] (index)
    if index.is_a?Integer
      if index == 0
        return @head.value
      elsif index == (@size-1)
        return @tail.value
      elsif index < (@size-1) && index > 0
        iterator = @head
	index.times{iterator = iterator.next}
	return iterator.value
      else
        return nil
      end
    end
  end
end
end


