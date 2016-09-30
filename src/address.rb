class Address
  MIN_ADDRESS_LINES = 3

  attr_accessor :name

  def initialize(addr_lines=[])
    addr_lines = get_addr_lines if addr_lines.length == 0

    validate_addr_lines(addr_lines)

    @name = Name.new(addr_lines[0])

  end

  def say(what)
    @name.say what
  end

  private

  def get_addr_lines
    puts 'Give me an address in this format:'
    puts "\tName or Company"
    puts "\tLine 1 (street & house number)"
    puts "\tLine 2 (additional details) [optional]"
    puts "\tCity, State, Zip"
    puts "\tCountry or country code [optional]"
    puts 'Empty line and <Enter> to finish.'

    addr_lines = []
    line_in = gets.chomp

    until line_in == '' do
      addr_lines.push(line_in)
      line_in = gets.chomp
    end
    addr_lines
  end

  def validate_addr_lines(addr_lines)
    unless addr_lines.length >= MIN_ADDRESS_LINES
      raise "Not enough address lines. #{addr_lines.length} entered, at least #{MIN_ADDRESS_LINES} required."
    end
  end

end

class Name
  attr_accessor :first_name
  attr_accessor :last_name

  def initialize(name_string)
    parts = name_string.split
    @first_name = parts[0]

    if parts.length == 2
      @last_name = parts[1]
    end
  end

  def say(what)
    puts "#{what}, #{@first_name} #{@last_name}"
  end
end

begin
  address = Address.new
  address.say('Hello')
rescue => err
  puts "Error! #{err}"
end