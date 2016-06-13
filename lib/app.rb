require 'sinatra'
require 'json'

require_relative 'floor_route'
require_relative 'present'

get '/day1/:route' do
  route_string = params['route']
  route = FloorRoute.new route_string

  result = {
    route: route.route_string,
    final_floor: route.final_floor,
    first_basement: route.first_basement
   }

   result.to_json
end

post '/day2' do
  dimension_list = request.body

  dimensions = []

  dimension_list.each_line { |line|
    dimensions << line.strip
  }

  presents = dimensions.map { |dimension| Present.from_string dimension }
  total_paper = presents.reduce(0) { |sum, present|
    sum + present.required_paper
  }

  total_ribbon = presents.reduce(0) { |sum, present|
    sum + present.required_ribbon
  }

  result = {
    present_sizes: dimensions,
    total_paper: total_paper,
    total_ribbon: total_ribbon
   }

   result.to_json
end
