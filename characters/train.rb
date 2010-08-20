class Train < Chingu::GameObject
  trait :bounding_box
  traits :collision_detection, :velocity, :timer

  def initialize(options = {})
    super(options)
    self.input = {:holding_left => :move_left, :holding_right => :move_right, :move_up => :move_down,
      :holding_up=>:move_up, :holding_down => :move_down, :move_down => :move_down}
      
    @red = Gosu::Color.new(0xFFFF0000)
    @white = Gosu::Color.new(0xFFFFFFFF)
    self.max_velocity = 15
  end

  def move_left;  @x -= 3; end
  def move_right; @x += 3; end
  def move_up;    @y -= 3; end
  def move_down;  @y += 3; end

  def accelerate
    #self.velocity_x = Gosu::offset_x(self.angle, 0.5)*self.max_velocity[0]
    #self.velocity_y = Gosu::offset_y(self.angle, 0.5)*self.max_velocity[0]
  end

  def brake
    #self.velocity_x = -Gosu::offset_x(self.angle, 0.5)*self.max_velocity[0]
    #self.velocity_y = -Gosu::offset_y(self.angle, 0.5)*self.max_velocity[0]
  end

  def update
    self.velocity_x *= 0.95
    self.velocity_y *= 0.95

    @x %= $window.width
    @y %= $window.height
    self.draw
  end

  def destroy
    puts " destroyed"
  end

  def hit_by(object)
    during(100) { self.color = @red; self.mode = :additive }.then { self.color = @white; self.mode = :default }
  end
end