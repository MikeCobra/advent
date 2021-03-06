require 'sinatra'
require 'json'

require_relative 'day1/floor_route'
require_relative 'day2/present_list'
require_relative 'day3/house_route'
require_relative 'day4/advent_coin'

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
    visited_houses_count: route.visited_houses.count,
    visited_houses_with_robot: route.visited_houses_with_robot,
    visited_houses_with_robot_count: route.visited_houses_with_robot.count
  }

  result.to_json
end

get '/day4/:secret' do
  coin = AdventCoin.new params['secret']

  result = {
    secret: coin.secret,
    integer: coin.integer,
    integer_six: coin.integer_six
  }

  result.to_json
end
