ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require 'json'

require 'advent'

describe 'The Advent App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/day1/' do
    context 'when given a floor route' do
      it "returns the route" do
        route = '(())))'

        get "/day1/#{route}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['route']).to eq route
      end

      it "returns the final floor" do
        route = '(())))'

        get "/day1/#{route}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['final_floor']).to eq -2
      end

      it "returns the step the basement is first entered" do
        route = '(())))'

        get "/day1/#{route}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['first_basement']).to eq 5
      end
    end
  end

  describe '/day2/' do
    context 'when given a lit of presents' do
      it "returns the list of presents" do
        list = "2x3x4\n1x1x10"

        post "/day2", list
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['present_sizes']).to eq ['2x3x4', '1x1x10']
      end

      it "returns the total paper needed" do
        list = "2x3x4\n1x1x10"

        post "/day2", list
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['total_paper']).to eq 101
      end

      it "returns the total ribbon neeeded" do
        list = "2x3x4\n1x1x10"

        post "/day2", list
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['total_ribbon']).to eq 48
      end
    end
  end
end
