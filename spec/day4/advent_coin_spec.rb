require 'day4/advent_coin'

RSpec.describe AdventCoin do
  describe '#secret' do
    context 'when given secret' do
      it 'should return secret' do
        secret = 'abcdef'
        coin = AdventCoin.new secret

        result = coin.secret

        expect(result).to eq secret
      end
    end
  end

  describe '#integer' do
    context 'when given secret' do
      it 'should return lowest integer which gives hash with leading 5 zeros' do
        secret = 'abcdef'
        coin = AdventCoin.new secret

        result = coin.integer

        expect(result).to eq 609043
      end
    end
  end

  describe '#integer_six' do
    context 'when given secret' do
      it 'should return lowest integer which gives hash with leading 5 zeros' do
        secret = 'abcdef'
        coin = AdventCoin.new secret

        result = coin.integer_six

        expect(result).to eq 6742839
      end
    end
  end
end
