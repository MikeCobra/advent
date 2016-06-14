require 'day3/house_route'

RSpec.describe HouseRoute do
  describe '#route' do
    context 'when given route' do
      it 'should return route' do
        route_string = '>^<vv>^'
        route = HouseRoute.new route_string

        result = route.route

        expect(result).to eq route_string
      end
    end
  end

  describe '#location' do
    context 'when given route with only lefts' do
      it 'should return postion to the left' do
        route_string = '<<'
        route = HouseRoute.new route_string

        result = route.location

        expected_location = {x: -2, y: 0}
        expect(result).to eq expected_location
      end
    end

    context 'when given route with only rights' do
      it 'should return postion to the right' do
        route_string = '>>'
        route = HouseRoute.new route_string

        result = route.location

        expected_location = {x: 2, y: 0}
        expect(result).to eq expected_location
      end
    end

    context 'when given route with only ups' do
      it 'should return postion above' do
        route_string = '^^'
        route = HouseRoute.new route_string

        result = route.location

        expected_location = {x: 0, y: 2}
        expect(result).to eq expected_location
      end
    end

    context 'when given route with only downs' do
      it 'should return postion below' do
        route_string = 'vv'
        route = HouseRoute.new route_string

        result = route.location

        expected_location = {x: 0, y: -2}
        expect(result).to eq expected_location
      end
    end

    context 'when given route with all directions' do
      it 'should return correct final postion' do
        route_string = '>^<vv>^'
        route = HouseRoute.new route_string

        result = route.location

        expected_location = {x: 1, y: 0}
        expect(result).to eq expected_location
      end
    end
  end

  describe '#visted_houses' do
    context 'when given route with only lefts' do
      it 'should return houses to the left' do
        route_string = '<<'
        route = HouseRoute.new route_string

        result = route.visited_houses

        expected_houses = [
          {x: 0, y: 0},
          {x: -1, y: 0},
          {x: -2, y: 0}
        ]
        expect(result).to contain_exactly *expected_houses
      end
    end

    context 'when given route with only rights' do
      it 'should return houses to the right' do
        route_string = '>>'
        route = HouseRoute.new route_string

        result = route.visited_houses

        expected_houses = [
          {x: 0, y: 0},
          {x: 1, y: 0},
          {x: 2, y: 0}
        ]
        expect(result).to contain_exactly *expected_houses
      end
    end

    context 'when given route with only ups' do
      it 'should return houses above' do
        route_string = '^^'
        route = HouseRoute.new route_string

        result = route.visited_houses

        expected_houses = [
          {x: 0, y: 0},
          {x: 0, y: 1},
          {x: 0, y: 2}
        ]
        expect(result).to contain_exactly *expected_houses
      end
    end

    context 'when given route with only downs' do
      it 'should return houses below' do
        route_string = 'vv'
        route = HouseRoute.new route_string

        result = route.visited_houses

        expected_houses = [
          {x: 0, y: 0},
          {x: 0, y: -1},
          {x: 0, y: -2}
        ]
        expect(result).to contain_exactly *expected_houses
      end
    end

    context 'when given route with all directions' do
      it 'should all house on route' do
        route_string = '>^<vv>^'
        route = HouseRoute.new route_string

        result = route.visited_houses

        expected_houses = [
          {x: 0, y: 0},
          {x: 1, y: 0},
          {x: 1, y: 1},
          {x: 0, y: 1},
          {x: 0, y: -1},
          {x: 1, y: -1}
        ]
        expect(result).to contain_exactly *expected_houses
      end
    end
  end
end
