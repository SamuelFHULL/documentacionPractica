
Node = Struct.new(:value, :next, :prev)

class Lista
  attr_reader :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  def insert_head(value)
    if @size == 0
      @tail = value
      value.next = nil
    else
      @head.prev = value
      value.next = @head
    end
    @size = @size + 1
    @head = value
    value.prev = nil

  end
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
end
