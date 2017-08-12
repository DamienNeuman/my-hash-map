

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key || val.hash
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next if @prev
    @next.prev = @prev if @next
  end

end

class LinkedList
  include Enumerable
  def initialize
    @start = Node.new(:start, nil)
    @end = Node.new(:end, nil)
    @start.next = @end
    @end.prev = @start
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @start.next
  end

  def last
    @end.prev
  end

  def empty?
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key,val)
    new_node.next = @end
    last.next = new_node
    new_node.prev = last
    @end.prev = new_node
  end

  end

  def update(key, val)
  end

  def remove(key)
    current_node = first
    until current_node.key = key
      current_node = current_node.next
    end
    current_node.remove
  end

  def each
    current_node = @start
    until current_node == nil
      yield current_node.val
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
