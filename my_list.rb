# rubocop:disable Lint/AmbiguousBlockAssociation

require './enumerable'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def each
    counter = 0
    while counter < @list.length
      yield @list[counter]
      counter += 1
    end
  end
end

list = MyList.new(1, 2, 3, 4)

# Test #all?
puts list.all? { |e| e < 5 }
puts list.all? { |e| e > 5 }

# Test #any?
puts list.any? { |e| e == 2 }
puts list.any? { |e| e == 5 }

# Test #filter
p list.filter { |e| e&.even? }

# rubocop:enable Lint/AmbiguousBlockAssociation
