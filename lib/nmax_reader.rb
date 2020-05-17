#!/usr/bin/ruby
require_relative './nmax_core'

class NmaxReader
  attr_reader :block_length

  def initialize
    @digit_buffer = ''
    @block_length = 121
    @data_size = 0
  end

  def main
    raise ArgumentError, 'You must pass argument - maximum length of matches found.' if ARGV.length != 1

    capture_data(ARGV.first.to_i)
  end

  def capture_data(count_limit, verbose = false)
    maximum_numbers = NmaxCore.new(count_limit)

    loop do
      block = $stdin.read(@block_length)
      break if block.empty?

      @data_size += block.length

      print "\rReading: #{@data_size}." if verbose
      items = block.scan(/\d+/)

      # Extreme cases.
      # 1. If the entire read data block is a string
      if items.empty? && !@digit_buffer.empty?
        maximum_numbers.propose @digit_buffer.to_i
        @digit_buffer = ''
      end

      # 2. If the entire block of read data is a number, add it to the buffer
      if block =~ /^\d+$/
        @digit_buffer << block
        next
      end

      # 3. If the first found number is the beginning of a block of read data - add it to the buffer and accept
      if block =~ /^\d/ && !items.empty?
        next if items.first.length == @block_length

        @digit_buffer << items.first
        maximum_numbers.propose @digit_buffer.to_i
        @digit_buffer = ''
        items.shift
      end

      # 4. If the last found number is the end of the block of read data - add it to the buffer
      if block =~ /\d$/ && !items.empty?
        @digit_buffer << items.last
        items.pop
      end

      # Common, the remaining numbers found, if any, are accepted without buffering
      items.each { |item| maximum_numbers.propose item.to_i } unless items.empty?

      break if block.length < @block_length
    end
    maximum_numbers.propose @digit_buffer.to_i if @digit_buffer.length.positive?

    puts "maximum_numbers.items: #{maximum_numbers.items.join(', ')}"
    maximum_numbers.items
  end
end
