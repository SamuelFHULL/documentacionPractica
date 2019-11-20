
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
end
