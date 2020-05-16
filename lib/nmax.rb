#!/usr/bin/ruby

module NMax
  def self.main
    raise ArgumentError, 'You must pass argument - maximum length of matches found.' if ARGV.length != 1
    # raise 'You must pass argument - maximum length of matches found.' if ARGV.length != 1
  end
end

NMax.main
