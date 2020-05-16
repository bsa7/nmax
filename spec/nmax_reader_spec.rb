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
      expect(reader_instance.capture_data).to be_zero
      $stdin = STDIN
    end

    it 'must read text with digits from stdin and returns count of founded numbers.' do
      $stdin = StringIO.new('Text with 777 digits 999')
      expect(reader_instance.capture_data).to be == 2
    end
  end
end
