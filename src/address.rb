class Address

  attr_accessor :zip
  attr_accessor :state

  def initialize()
    @fields = RawAddressFields.new()

    @state = State.new(@fields.state)
    @zip = Zip.new(@fields.zip)
  end

  def pretty_print
    puts "#{@fields.name}"
    puts "#{@fields.first_line}"
    puts "#{@fields.second_line}" unless @fields.second_line.nil?
    puts "#{@fields.city}, #{@state.abbreviation.upcase} #{@zip}"
  end

  private

  attr_accessor :fields

end

class State
  attr_accessor :name
  attr_accessor :abbreviation

  def initialize(name_or_abbreviation)
    if name_or_abbreviation.length == 2
      @abbreviation = name_or_abbreviation
      @name = @@abbr_to_name_map[@abbreviation.upcase.to_sym]
    else
      @name = name_or_abbreviation
      match = @@abbr_to_name_map.find {|k,v| v.upcase == @name.upcase}
      @abbreviation = match[0] unless match.nil?
    end
    puts "!! #{@abbreviation} #{@name}"

    raise "Invalid state \'#{name_or_abbreviation}\'." if @name.nil? or @abbreviation.nil?
  end

  private

  @@abbr_to_name_map = {  AK: "Alaska",
                          AL: "Alabama",
                          AR: "Arkansas",
                          AS: "American Samoa",
                          AZ: "Arizona",
                          CA: "California",
                          CO: "Colorado",
                          CT: "Connecticut",
                          DC: "District of Columbia",
                          DE: "Delaware",
                          FL: "Florida",
                          GA: "Georgia",
                          GU: "Guam",
                          HI: "Hawaii",
                          IA: "Iowa",
                          ID: "Idaho",
                          IL: "Illinois",
                          IN: "Indiana",
                          KS: "Kansas",
                          KY: "Kentucky",
                          LA: "Louisiana",
                          MA: "Massachusetts",
                          MD: "Maryland",
                          ME: "Maine",
                          MI: "Michigan",
                          MN: "Minnesota",
                          MO: "Missouri",
                          MS: "Mississippi",
                          MT: "Montana",
                          NC: "North Carolina",
                          ND: "North Dakota",
                          NE: "Nebraska",
                          NH: "New Hampshire",
                          NJ: "New Jersey",
                          NM: "New Mexico",
                          NV: "Nevada",
                          NY: "New York",
                          OH: "Ohio",
                          OK: "Oklahoma",
                          OR: "Oregon",
                          PA: "Pennsylvania",
                          PR: "Puerto Rico",
                          RI: "Rhode Island",
                          SC: "South Carolina",
                          SD: "South Dakota",
                          TN: "Tennessee",
                          TX: "Texas",
                          UT: "Utah",
                          VA: "Virginia",
                          VI: "Virgin Islands",
                          VT: "Vermont",
                          WA: "Washington",
                          WI: "Wisconsin",
                          WV: "West Virginia",
                          WY: "Wyoming"
  }
end

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