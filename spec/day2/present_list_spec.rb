require 'day2/present_list'

RSpec.describe PresentList do
  describe '#from_string' do
    context 'when given a valid string' do
      it 'should contain the correct presents' do
        list = PresentList.from_string "2x3x4\n1x1x10"

        expected_list = [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        expect(list.presents).to eq expected_list
      end
    end
  end

  describe '#total_paper' do
    context 'when multiple presents' do
      it 'should sum the paper required for each present' do
        list = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        expect(list.total_paper).to eq 101
      end
    end

    context 'when one present' do
      it 'should return the paper required for that present' do
        list = PresentList.new [Present.new(2, 3, 4)]
        expect(list.total_paper).to eq 58
      end
    end
  end

  describe '#total_ribbon' do
    context 'when multiple presents' do
      it 'should sum the ribbon required for each present' do
        list = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        expect(list.total_ribbon).to eq 48
      end
    end

    context 'when one present' do
      it 'should return the ribbon required for that present' do
        list = PresentList.new [Present.new(2, 3, 4)]
        expect(list.total_ribbon).to eq 34
      end
    end
  end

  describe '#==' do
    context 'when given a list of the same presents in the same order' do
      it 'should return true' do
        list1 = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        list2 = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]

        expect(list1 == list2).to eq true
      end
    end

    context 'when given a list of the same presents in a different order' do
      it 'should return false' do
        list1 = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        list2 = PresentList.new [Present.new(1, 1, 10), Present.new(2, 3, 4)]

        expect(list1 == list2).to eq false
      end
    end

    context 'when given a list of different presents' do
      it 'should return false' do
        list1 = PresentList.new [Present.new(2, 3, 4), Present.new(1, 1, 10)]
        list2 = PresentList.new [Present.new(1, 2, 10), Present.new(2, 5, 4)]

        expect(list1 == list2).to eq false
      end
    end
  end
end
