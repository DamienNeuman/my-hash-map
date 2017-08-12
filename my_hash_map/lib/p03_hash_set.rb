require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    garbage = key.hash
    unless include?(garbage)
      self[garbage] << garbage
      @count+=1
    end
    resize! if @count == @num_buckets
  end

  def include?(key)
    garbage = key.hash
    self[garbage].include?(garbage)
  end

  def remove(key)
    garbage = key.hash
    self[garbage].delete(garbage)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!

    @num_buckets *= 2
    new_store = Array.new(@num_buckets) {Array.new}
    @store.each do |bucket|
      bucket.each do |el|
        new_idx = el % num_buckets
        new_store[new_idx] << el
      end
    end
    @store = new_store
  end
end
