class Train < Chingu::GameObject
  trait :bounding_circle
  traits :collision_detection, :velocity

  def initialize(options = {})
    super(options)
    self.input = { :holding_left => :move_left, :holding_right => :move_right,
      :holding_up=>:accelerate, :holding_down => :brake, :move_down => :move_down }
    self.max_velocity = 15
  end

  def move_left;  @x -= 1; end
  def move_right; @x += 1; end
  def move_up;    @y -= 1; end
  def move_down;  @y += 1; end

  def accelerate
    self.velocity_x = Gosu::offset_x(self.angle, 0.5)*self.max_velocity[0]
    self.velocity_y = Gosu::offset_y(self.angle, 0.5)*self.max_velocity[0]
  end

  def brake
    self.velocity_x = -Gosu::offset_x(self.angle, 0.5)*self.max_velocity[0]
    self.velocity_y = -Gosu::offset_y(self.angle, 0.5)*self.max_velocity[0]
  end

  def update
    self.velocity_x *= 0.95 # dampen the movement
    self.velocity_y *= 0.95

    @x %= $window.width # wrap around the screen
    @y %= $window.height
  end
end

