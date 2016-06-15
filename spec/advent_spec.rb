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
    context 'when given a list of presents' do
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

  describe '/day3/' do
    context 'when given a string of a house route' do
      it "returns the route" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['route']).to eq route
      end

      it "returns the final location" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expected_location = {'x' => 1, 'y' => 0}
        expect(json['location']).to eq expected_location
      end

      it "returns the list of visited houses" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expected_list = [
          {'x' => 0, 'y' => 0},
          {'x' => 1, 'y' => 0},
          {'x' => 1, 'y' => 1},
          {'x' => 0, 'y' => 1},
          {'x' => 0, 'y' => -1},
          {'x' => 1, 'y' => -1}
        ]
        expect(json['visited_houses']).to contain_exactly *expected_list
      end

      it "returns the number of visted houses" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['visited_houses_count']).to eq 6
      end

      it "returns the list of visited houses when using robot" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expected_list = [
          {'x' => 0, 'y' => 0},
          {'x' => 1, 'y' => 0},
          {'x' => 0, 'y' => 1},
          {'x' => 0, 'y' => -1}
        ]
        expect(json['visited_houses_with_robot']).to contain_exactly *expected_list
      end

      it "returns the number of visted houses when using robot" do
        route = ">^<vv>^"

        post '/day3', route
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['visited_houses_with_robot_count']).to eq 4
      end
    end
  end

  describe '/day4/' do
    context 'when given a string of a secret' do
      it "returns the string" do
        secret = "abcdef"

        md5 = double('md5')
        allow(Digest::MD5).to receive(:new) { md5 }
        allow(md5).to receive(:<<)
        allow(md5).to receive(:hexdigest) { '000000' }

        get "/day4/#{secret}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['secret']).to eq secret
      end

      it "returns the lowest integer that gives a 5 zero starting hash" do
        secret = "abcdef"

        md5 = double('md5')
        md5success = double('md5')
        allow(Digest::MD5).to receive(:new).and_return(md5, md5success, md5, md5success)
        allow(md5).to receive(:<<)
        allow(md5).to receive(:hexdigest) { '000011' }
        allow(md5success).to receive(:<<)
        allow(md5success).to receive(:hexdigest) { '000000' }

        get "/day4/#{secret}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['integer']).to eq 2
      end

      it "returns the lowest integer that gives a 6 zero starting hash" do
        secret = "abcdef"

        md5 = double('md5')
        md5success = double('md5')
        allow(Digest::MD5).to receive(:new).and_return(md5, md5success, md5, md5success)
        allow(md5).to receive(:<<)
        allow(md5).to receive(:hexdigest) { '000011' }
        allow(md5success).to receive(:<<)
        allow(md5success).to receive(:hexdigest) { '000000' }

        get "/day4/#{secret}"
        expect(last_response).to be_ok

        json = JSON.parse last_response.body
        expect(json['integer_six']).to eq 2
      end
    end
  end
end
