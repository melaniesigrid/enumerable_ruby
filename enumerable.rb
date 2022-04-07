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
