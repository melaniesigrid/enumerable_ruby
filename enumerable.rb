module MyEnumerable
  def all?
    result = true
    each { |n| result = false unless yield n }
    result
  end

  def any?
    result = false
    each { |n| result = true if yield n }
    result
  end

  def filter
    result = []
    each { |n| result.append(n) if yield n }
    result
  end
end

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    @list.each do |l|
      yield l
    end
  end
end

list = MyList.new(1, 2, 3, 4)


# Test #all?
puts list.all? {|e| e < 5}
puts list.all? {|e| e > 5}

# Test #any?
puts list.any? {|e| e == 2}
puts list.any? {|e| e == 5}

# Test #filter
p list.filter {|e| e.even?}
