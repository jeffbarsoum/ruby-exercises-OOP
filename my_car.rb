class MyCar
  attr_accessor :year, :color, :model, :name

  def initialize year, color, model
    err = <<-STRING
    What kind of car tho??
    (Specify year, color, and model pls thx!)

    STRING

    return print err  unless :year && :color && :model
    @speed = 0
    @started = false
    @year = year
    @color = color
    @model = model
    @name = "#{self.year} #{self.color} #{self.model}"
  end

  def speed
    @speed
  end

  def started
    @started
  end

  def name=(year, color, model)
    @name = "#{self.year} #{self.color} #{self.model}"
  end

  def name
    @name
  end

  def year=(y)
    name(self.year, self.color, self.model)
    @year = y
  end

  def year
    @year
  end

  def color=(c)
    name(self.year, self.color, self.model)
    @color = c
  end

  def color
    @color
  end

  def model=(m)
    name(self.year, self.color, self.model)
    @model = m
  end

  def model
    @model
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

  private

  def started=(s)
    @started = s
  end

  def speed=(s)
    @speed = s
  end

end



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
