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