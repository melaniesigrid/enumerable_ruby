module MyEnumerable
  def all?
    result = true
    each { |n| result = false unless yield n }
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

puts list.all? {|e| e < 5}
puts list.all? {|e| e > 5}