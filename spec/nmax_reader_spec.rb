# frozed_string_literal = true
require_relative '../lib/nmax_reader'

RSpec.describe NmaxReader do
  let(:reader_instance) { described_class.new }

  describe 'arguments' do
    it 'must raise exception without arguments' do
      expect { reader_instance.main }.to raise_error(ArgumentError)
    end
  end

  describe 'capture data' do
    after do
      $stdin = STDIN
    end

    it 'must read text without digits from stdin and returns zero.' do
      $stdin = StringIO.new('Text only string')
      expect(reader_instance.capture_data(1000).length).to be_zero
      $stdin = STDIN
    end

    it 'must read text with digits from stdin and returns count of founded numbers.' do
      $stdin = StringIO.new('Text with 777 digits 999')
      expect(reader_instance.capture_data(1000).length).to be == 2
    end

    it 'must filter only maximum numbers' do
      $stdin = StringIO.new('Text with numbers: 555, 100500, 222, 333, 1001, 777')
      expect(reader_instance.capture_data(3)).to be == [777, 1001, 100_500]
    end

    it 'must coverage case when while number found, next readed block is a string' do
      $stdin = StringIO.new('t' * (reader_instance.block_length - 3) + '777' + 'ddd dff ' * 20)
      expect(reader_instance.capture_data(1000).length).to be == 1
    end

    it 'must coverage case when next readed block is all number' do
      length = reader_instance.block_length - 3
      $stdin = StringIO.new('t' * length + '777' + '333' * length + '3434 sdf werfwe')
      expect(reader_instance.capture_data(1000).length).to be == 1
    end
  end
end
