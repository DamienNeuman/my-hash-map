class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)

  end
end


class IntSet
  attr_reader :count
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    unless include?(num)
      self[num] << num
    end
  end

  def remove(num)
    @store[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end
# self[num] === @store[num % num_buckets]
  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count+=1
      resize! if @count == @store.length

    end
  end

  def remove(num)
    @count -=1 if self[num].include?(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    if @store.length == @count
      p "store.length #{@store.length}, count #{@count}"
      new_store = Array.new(@count * 2){Array.new}
      @num_buckets = @store.length * 2
      @count.times do |i|
        @store[i].each do |el|
          new_idx = el % @num_buckets
          new_val = el
          new_store[new_idx] << new_val
        end
      end
      @store = new_store
    end
  end
end
