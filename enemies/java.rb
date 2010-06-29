class Java < Chingu::GameObject
  trait :bounding_box
  trait :collision_detection
  trait :animation, :delay => 200

  def initialize(options={})
    super(:width => 50, :height => 50, :image => Image["files/java-300.png"])

    self.x =rand * 800
    self.y =rand * 600
    cache_bounding_box
  end

  def update
    self.draw
  end
end

