class State
  attr_accessor :name
  attr_accessor :abbreviation

  STATE_MAP = {AK: 'Alaska',
               AL: 'Alabama',
               AR: 'Arkansas',
               AS: 'American Samoa',
               AZ: 'Arizona',
               CA: 'California',
               CO: 'Colorado',
               CT: 'Connecticut',
               DC: 'District of Columbia',
               DE: 'Delaware',
               FL: 'Florida',
               GA: 'Georgia',
               GU: 'Guam',
               HI: 'Hawaii',
               IA: 'Iowa',
               ID: 'Idaho',
               IL: 'Illinois',
               IN: 'Indiana',
               KS: 'Kansas',
               KY: 'Kentucky',
               LA: 'Louisiana',
               MA: 'Massachusetts',
               MD: 'Maryland',
               ME: 'Maine',
               MI: 'Michigan',
               MN: 'Minnesota',
               MO: 'Missouri',
               MS: 'Mississippi',
               MT: 'Montana',
               NC: 'North Carolina',
               ND: 'North Dakota',
               NE: 'Nebraska',
               NH: 'New Hampshire',
               NJ: 'New Jersey',
               NM: 'New Mexico',
               NV: 'Nevada',
               NY: 'New York',
               OH: 'Ohio',
               OK: 'Oklahoma',
               OR: 'Oregon',
               PA: 'Pennsylvania',
               PR: 'Puerto Rico',
               RI: 'Rhode Island',
               SC: 'South Carolina',
               SD: 'South Dakota',
               TN: 'Tennessee',
               TX: 'Texas',
               UT: 'Utah',
               VA: 'Virginia',
               VI: 'Virgin Islands',
               VT: 'Vermont',
               WA: 'Washington',
               WI: 'Wisconsin',
               WV: 'West Virginia',
               WY: 'Wyoming'}

  def initialize(name_or_abbreviation)
    if name_or_abbreviation.length == 2
      @abbreviation = name_or_abbreviation
      @name = STATE_MAP[@abbreviation.upcase.to_sym]
    else
      @name = name_or_abbreviation
      match = STATE_MAP.find { |_, v| v.upcase == @name.upcase }
      @abbreviation = match[0] unless match.nil?
    end
    puts "!! #{@abbreviation} #{@name}"

    raise "Invalid state \'#{name_or_abbreviation}\'." if @name.nil? or @abbreviation.nil?
  end
end