require_relative 'present'

class PresentList
  attr_reader :presents

  def initialize(list)
    @presents = list
  end

  def self.from_string(string)
    list = []
    string.each_line { |line|
      list << Present.from_string(line.strip)
    }
    PresentList.new list
  end

  def total_paper
    @presents.reduce(0) { |sum, present|
      sum + present.required_paper
    }
  end

  def total_ribbon
    @presents.reduce(0) { |sum, present|
      sum + present.required_ribbon
    }
  end

  def ==(another_present_list)
    @presents == another_present_list.presents
  end
end
