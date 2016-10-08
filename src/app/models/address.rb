require_relative 'state.rb'
require_relative 'zip.rb'
require_relative 'raw_address_fields.rb'

class Address

  attr_accessor :zip
  attr_accessor :state

  def initialize()
    @fields = RawAddressFields.new

    @state = State.new(@fields.state)
    @zip = Zip.new(@fields.zip)
  end

  def pretty_print
    puts "#{@fields.name}"
    puts "#{@fields.first_line}"
    puts "#{@fields.second_line}" unless @fields.second_line.empty?
    puts "#{@fields.city}, #{@state.abbreviation.upcase} #{@zip}"
  end

  private

  attr_accessor :fields

end

class String
  def empty?
    self.nil? || self.strip.length == 0
  end
end

begin
  address = Address.new

  puts "-- Parsed Address --"
  address.pretty_print
rescue => err
  puts "Error! #{err}"
end