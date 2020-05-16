# frozen_string_literal = true

class NmaxCore
  attr_reader :min, :max, :size

  def initialize(count_limit)
    @buffer = []
    @min = nil
    @max = 0
    @size = 0
    @count_limit = count_limit
  end

  def propose(number_value)
    sorted_insert(number_value)
    @min = number_value if @min.nil?

    return if @size <= @count_limit

    @buffer.shift
    @size -= 1
  end

  def items
    @buffer
  end

  private

  def sorted_insert(number_value)
    if number_value > @max
      push_to_end(number_value)
    elsif number_value < @min
      push_to_begin(number_value)
    else
      insert(number_value)
    end
  end

  def insert(number_value)
    index = @buffer.bsearch_index { |x| x >= number_value }
    return unless index && @buffer[index] != number_value

    @buffer.insert(index, number_value)
    @size += 1
  end

  def push_to_end(number_value)
    @buffer << number_value
    @max = number_value
    @size += 1
  end

  def push_to_begin(number_value)
    @buffer.unshift number_value
    @min = number_value
    @size += 1
  end
end
