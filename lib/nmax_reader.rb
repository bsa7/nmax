#!/usr/bin/ruby

class NmaxReader
  def main
    raise ArgumentError, 'You must pass argument - maximum length of matches found.' if ARGV.length != 1
  end

  def capture_data
    block_length = 121
    data_size = 0
    maximum_numbers_founded = []
    digit_buffer = ''

    loop do
      block = $stdin.read(block_length)
      break if block.empty?

      data_size += block.length
      print "\rReading: #{data_size}."
      puts "block: #{block}"
      block.each_char do |char|
        if char =~ /\d/
          digit_buffer << char
        elsif digit_buffer.length.positive?
          maximum_numbers_founded.push digit_buffer.to_i
          digit_buffer = ''
        end
      end

      maximum_numbers_founded.push digit_buffer.to_i if digit_buffer.length.positive?
      break if block.length < block_length
    end

    puts "maximum_numbers_founded: #{maximum_numbers_founded.join(', ')}"
    maximum_numbers_founded.length
  end
end
