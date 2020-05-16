#!/usr/bin/ruby

class NmaxReader
  def main
    raise ArgumentError, 'You must pass argument - maximum length of matches found.' if ARGV.length != 1
  end

  def capture_data
    eof_not_reached = true
    block_length = 121
    data_size = 0
    maximum_numbers_founded = []
    digit_buffer = ''

    while eof_not_reached
      block = $stdin.read(block_length)
      data_size += block.length
      print "\rReading: #{data_size}."
      block.each_char do |char|
        if char =~ /\d/
          digit_buffer << char
        elsif digit_buffer.length.positive?
          maximum_numbers_founded.push digit_buffer.to_i
          digit_buffer = ''
        end
      end
      break if block.length < block_length
    end

    maximum_numbers_founded.length
  end
end
