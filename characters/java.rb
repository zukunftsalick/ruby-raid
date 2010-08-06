class Java < Chingu::GameObject
  trait :bounding_box
  trait :collision_detection
  trait :timer

  def initialize(options={})
    super(:width => 50, :height => 50, :image => "media/java.png")

    self.x =rand * 800
    self.y =rand * 600
    cache_bounding_box
  end

  def update
    self.draw
  end

  def hit_by(object)
    #during(1000) {self.image = Image["media/java_explode.png"]}
    during(3000) {self.image = Image["media/java_explode_2.png"]}
    self.destroy
  end
end

