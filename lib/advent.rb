require 'sinatra'
require 'json'

require_relative 'day1/floor_route'
require_relative 'day2/present_list'
require_relative 'day3/house_route'

get '/day1/:route' do
  route = FloorRoute.new params['route']

  result = {
    route: route.route_string,
    final_floor: route.final_floor,
    first_basement: route.first_basement
   }

   result.to_json
end

post '/day2' do
  list = PresentList.from_string request.body

  result = {
    present_sizes: list.presents.map { |p| p.to_s },
    total_paper: list.total_paper,
    total_ribbon: list.total_ribbon
   }

  result.to_json
end

post '/day3' do
  route = HouseRoute.new request.body.string

  result = {
    route: route.route,
    location: route.location,
    visited_houses: route.visited_houses,
    visited_houses_count: route.visited_houses.count
  }

  JSON.dump(result)
end
