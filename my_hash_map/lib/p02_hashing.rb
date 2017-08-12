class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    current_hash = 1
    self.each_with_index do |el, idx|
      #p "el #{el}, idx #{idx}"
      #(el+idx).hash
      #
      current_hash *= (el.hash + idx.hash).hash
    end
    Integer(current_hash.to_s[0..19])
  end
end

class String
  def hash
    self.chars.map {|c| c.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_garbage = 1
    self.each do |k,v|
      new_garbage *= (k.to_s.hash + v.hash)
    end
    new_garbage
  end
end
