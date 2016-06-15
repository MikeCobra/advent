require 'digest'

class AdventCoin
  attr_reader :secret

  def initialize(secret)
    @secret = secret
  end

  def integer
    integer_start_with '00000'
  end

  def integer_six
    integer_start_with '000000'
  end

  private

  def integer_start_with(string)
    i = 0
    solved = false
    while !solved
      i += 1
      md5 = Digest::MD5.new
      md5 << "#{@secret}#{i.to_s}"
      solved = md5.hexdigest.start_with? string
    end
    i
  end
end
