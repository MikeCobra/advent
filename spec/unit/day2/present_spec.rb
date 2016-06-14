require 'day2/present'

RSpec.describe Present do
  describe '#smallest_side' do
    context 'all sides are different' do
      it 'should return the smallest side\'s area' do
        present = Present.new(2 ,3, 5)
        result = present.smallest_side
        expect(result).to eq 6
      end
    end

    context 'when two sides are the smallest' do
      it 'should return the smallest_side\'s area' do
        present = Present.new(2, 3, 3)
        result = present.smallest_side
        expect(result).to eq 6
      end
    end

    context 'when two sides are equal and larger' do
      it 'should return the smallest_side\'s area' do
        present = Present.new(2, 2, 3)
        result = present.smallest_side
        expect(result).to eq 4
      end
    end

    context 'when three sides are equal' do
      it 'should return the smallest_side\'s area' do
        present = Present.new(2, 2, 2)
        result = present.smallest_side
        expect(result).to eq 4
      end
    end
  end

  describe '#surface_area' do
    context 'all measurements are given' do
      it 'should return the surface_area' do
        present = Present.new(2 ,3, 5)
        result = present.surface_area
        expect(result).to eq 62
      end
    end
  end

  describe '#required_paper' do
    context 'all measurements are given' do
      it 'should return the surface_area plus the smallest_side' do
        present = Present.new(2 ,3, 4)
        result = present.required_paper
        expect(result).to eq 58
      end

      it 'should return the surface_area plus the smallest_side' do
        present = Present.new(1 ,1, 10)
        result = present.required_paper
        expect(result).to eq 43
      end
    end
  end

  describe '#smallest_perimeter' do
    context 'all measurements are given' do
      it 'should return the smallest perimeter' do
        present = Present.new(2 ,3, 4)
        result = present.smallest_perimeter
        expect(result).to eq 10
      end

      it 'should return the smallest perimeter' do
        present = Present.new(1 ,1, 10)
        result = present.smallest_perimeter
        expect(result).to eq 4
      end
    end
  end

  describe '#volume' do
    context 'all measurements are given' do
      it 'should return the volume' do
        present = Present.new(2 ,3, 4)
        result = present.volume
        expect(result).to eq 24
      end

      it 'should return the volume' do
        present = Present.new(1 ,1, 10)
        result = present.volume
        expect(result).to eq 10
      end
    end
  end

  describe '#required_ribbon' do
    context 'all measurements are given' do
      it 'should return the surface_area plus the smallest_side' do
        present = Present.new(2 ,3, 4)
        result = present.required_ribbon
        expect(result).to eq 34
      end

      it 'should return the surface_area plus the smallest_side' do
        present = Present.new(1 ,1, 10)
        result = present.required_ribbon
        expect(result).to eq 14
      end
    end
  end

  describe '#from_string' do
    context 'when given a string' do
      it 'should return a present with correct dimensions' do
        present = Present.from_string '2x3x5'
        expect(present).to eq Present.new(2, 3, 5)
      end
    end
  end

  describe '#==' do
    context 'when given a present of the same dimensions' do
      it 'should return true' do
        present1 = Present.new(1, 2, 3)
        present2 = Present.new(1, 2, 3)
        expect(present1 == present2).to eq true
      end
    end

    context 'when given a present of different dimensions' do
      it 'should return true' do
        present1 = Present.new(1, 2, 3)
        present2 = Present.new(1, 3, 5)
        expect(present1 == present2).to eq false
      end
    end
  end

  describe '#to_s' do
    context 'when given a present with dimensions' do
      it 'should give a string representation of the dimnesions' do
        present = Present.new(1, 2, 3)
        expect(present.to_s).to eq '1x2x3'
      end
    end
  end
end
