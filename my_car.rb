class MyCar
  attr_reader :speed, :started, :name
  attr_accessor :year, :color, :model

  @@car_inventory = {}

  def self.calc_miles_per_gallon miles, gallons
    miles_per_gallon = miles * 1.0 / gallons
  end

  def self.add_to_inventory attributes = {}
    car_name = "#{attributes[:year]} #{attributes[:color]} #{attributes[:model]}".to_sym
    is_car_exists = !!@@car_inventory[car_name]
    is_car_count_exists = is_car_exists && @@car_inventory[car_name][:count].is_a?(Integer)
    car_exists = is_car_exists && is_car_count_exists
    @@car_inventory[car_name][:count] += 1 if car_exists
    @@car_inventory[car_name] = { count: 1, attributes: attributes } unless car_exists
    puts @@car_inventory
  end

  def self.remove_from_inventory name
    car = @@car_inventory[name]
    return unless car
    @@car_inventory[name][:count] -= 1
    @@car_inventory.delete name if @@car_inventory[name][:count] = 0
    puts @@car_inventory
  end

  def self.clean_inventory
    @@car_inventory = {}
  end


  def initialize year, color, model
    err = <<-STRING
    What kind of car tho??
    (Specify year, color, and model pls thx!)

    STRING



    # @speed = 0
    # @started = false
    # @year = year
    # @color = color
    # @model = model
    # @name = "#{self.year} #{self.color} #{self.model}"

    # attributes = {year: @year, color: @color, model: @model}
    # self.class.add_to_inventory attributes
    get_new_car year, color, model

  end



  def get_new_car year, color, model
    err = <<-STRING
    That's the same car tho??
    Cars don't age or deprecate in ruby terminal land..
    Why limit yourself?
    Change it up, be different!

    STRING
    puts "#{self.year}"
    puts "#{self.color}"
    puts "#{self.model}"
    same_car = year == self.year && color == self.color && model = self.model
    puts err if same_car
    return if same_car

    @speed = 0
    @started = false
    @year = year unless year == self.year
    @color = color unless color == self.color
    @model = model unless model == self.model
    @name = "#{self.year} #{self.color} #{self.model}"
    self.class.add_to_inventory year: self.year, color: self.color, model: self.model
    puts "Congrats on your new #{self.name}!"
  end

  def paint_car color
    err = <<-STRING
    That's the same color tho??
    Paint doesn't fade or crack in ruby terminal land..
    Why limit yourself?
    Change it up, be different!

    STRING
    puts err if color == self.color
    return if color == self.color
    self.class.remove_from_inventory self.name.to_sym
    self.color = color
    self.class.add_to_inventory year: self.year, color: self.color, model: self.model
    self.name = "#{self.year} #{self.color} #{self.model}"
    puts "Ohh, #{self.color}, huh? Bold!"
  end

  def increase_speed acceleration
    puts "Start the car first!" unless self.started
    return unless self.started
    puts "Acceleration must be greater than 0!" unless acceleration > 0
    return unless acceleration > 0
    self.speed += acceleration
    puts self.speed
  end

  def decrease_speed deceleration
    puts "Start the car first!" unless self.started
    return unless self.started
    puts "Deceleration must be greater than 0!" unless deceleration > 0
    return unless deceleration > 0
    self.speed = self.speed - deceleration < 0 ? 0: self.speed - deceleration
    puts self.speed
  end

  def start_car
    is_started = self.started
    self.started = true
    puts "Started." unless is_started
    return unless is_started
    return puts "Car already started! Zzz..."
  end

  def stop_car
    is_started = self.started
    self.started = false
    speed = 0
    puts "Stopped." if is_started
    return if is_started
    return puts "Car already stopped! Zzz..."
  end

  def to_s
    puts "#{self.name}"
  end

  private

  def started=(s)
    @started = s
  end

  def speed=(s)
    @speed = s
  end

  def name=(n)
    @name = n
  end

end



  car = MyCar.new '2010', 'Blue', 'Honda'
  car = MyCar.new '2010', 'Blue', 'Honda'
  car.color
  car.speed
  car.year
  car.name
  car.increase_speed 20
  car.start_car
  car.increase_speed 20
  car.speed
  car.decrease_speed 30
  car.speed
  car.increase_speed 100
  car.speed
  car.stop_car
  car.speed
  # car.color = "Green" # should return NoMethod error, since it's reader only
  car.name
  # car.year = "2015" # should return NoMethod error, since it's reader only
  car.year
  car.color
  car.model
  car.get_new_car '2010', 'Blue', 'Honda' # should return error message
  # car.get_new_car year: '2010' # should return error message
  # car.get_new_car model: 'Chevrolet' # should return error message
  car.get_new_car '2015', 'Green', 'Subaru'
  car.name
  car.year
  car.color
  car.paint_car 'Green' # should return error msg
  car.paint_car 'Red'
  car.name
  car.year
  car.color
  car.model
  MyCar.clean_inventory
  MyCar.calc_miles_per_gallon 400, 15
  puts "#{car}"
