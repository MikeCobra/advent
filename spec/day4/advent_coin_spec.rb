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

        md5 = double('md5')
        md5success = double('md5')
        allow(Digest::MD5).to receive(:new).and_return(md5, md5success)
        allow(md5).to receive(:<<)
        allow(md5).to receive(:hexdigest) { '000011' }
        allow(md5success).to receive(:<<)
        allow(md5success).to receive(:hexdigest) { '000001' }

        result = coin.integer

        expect(result).to eq 2
      end
    end
  end

  describe '#integer_six' do
    context 'when given secret' do
      it 'should return lowest integer which gives hash with leading 5 zeros' do
        secret = 'abcdef'
        coin = AdventCoin.new secret

        md5 = double('md5')
        md5success = double('md5')
        allow(Digest::MD5).to receive(:new).and_return(md5, md5success)
        allow(md5).to receive(:<<)
        allow(md5).to receive(:hexdigest) { '000011' }
        allow(md5success).to receive(:<<)
        allow(md5success).to receive(:hexdigest) { '000000' }

        result = coin.integer_six

        expect(result).to eq 2
      end
    end
  end
end
