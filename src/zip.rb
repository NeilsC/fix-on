class Zip
  attr_accessor :zip
  attr_accessor :plus_4

  def initialize(input)
    raise "Invalid Zip Code." unless /^(?<zip_5>[0-9]{5})-?(?<plus_4>[0-9]{4})?$/ =~ input # Zip+4

    @zip = zip_5
    @plus_4 = plus_4
  end

  def to_s
    val = @zip

    val += "-#{@plus_4}" unless @plus_4.nil?

    val
  end
end