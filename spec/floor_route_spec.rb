require 'floor_route'

RSpec.describe FloorRoute do

  describe '#final_floor' do
    context 'with only left brackets' do
      it 'should only increase floor count' do
        route = FloorRoute.new '((('
        result = route.final_floor
        expect(result).to eq 3
      end
    end

    context 'with only left brackets' do
      it 'should only lowers floor count' do
        route = FloorRoute.new ')))'
        result = route.final_floor
        expect(result).to eq -3
      end
    end

    context 'with both types of brackets' do
      it 'should correctly increase and descrease floor count' do
        route = FloorRoute.new '))((((('
        result = route.final_floor
        expect(result).to eq 3
      end
    end
  end
  describe '#first_basement' do
    context 'when not entering basement' do
      it 'should return nil' do
        route = FloorRoute.new '((('
        result = route.first_basement
        expect(result).to eq nil
      end
    end

    context 'when entering the basement immediately' do
      it 'should return 1' do
        route = FloorRoute.new ')(((())))'
        result = route.first_basement
        expect(result).to eq 1
      end
    end

    context 'when entering basement at end' do
      it 'should return the length of string' do
        route = FloorRoute.new '((())))'
        result = route.first_basement
        expect(result).to eq 7
      end
    end
  end
end
