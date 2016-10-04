

class Address

  def initialize()
    @fields = RawAddressFields.new()

    normalize_input_fields
  end

  def pretty_print
    puts "#{@fields.name}"
    puts "#{@fields.first_line}"
    puts "#{@fields.second_line}" unless @fields.second_line.nil?
    puts "#{@fields.city}, #{@fields.state} #{@fields.zip}"
  end

  private

  attr_accessor :fields

  def normalize_input_fields
    normalize_zip
  end

  def normalize_zip
    raise "Invalid Zip Code." unless /^(?<zip_5>[0-9]{5})-?(?<plus_4>[0-9]{4})?$/ =~ @fields.zip  # Zip+4

    @fields.zip = zip_5

    @fields.zip += "-#{plus_4}" unless plus_4.nil?
  end


end


class RawAddressFields
  attr_accessor :name
  attr_accessor :first_line
  attr_accessor :second_line
  attr_accessor :city
  attr_accessor :state
  attr_accessor :zip

  def initialize()
    get_addr_input
  end

  private

  def get_addr_input
    puts 'Give me an address...'
    puts "\tName or Company: "
    @name = gets.chomp
    raise "Name or Company is required." if @name.empty?

    puts "\tLine 1 (street & house number) : "
    @first_line = gets.chomp
    raise "Line 1 is required." if @first_line.empty?

    puts "\tLine 2 (additional details) [optional] : "
    @second_line = gets.chomp

    puts "\tCity : "
    @city = gets.chomp
    raise "City is required." if @city.empty?

    puts "\tState : "
    @state = gets.chomp
    raise "State is required." if @state.empty?

    puts "\tZip : "
    @zip = gets.chomp
    raise "Zip is required." if @zip.empty?
  end

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