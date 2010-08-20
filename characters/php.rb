class PHP < Chingu::GameObject
  trait :bounding_box
  trait :collision_detection
  traits :timer

  def initialize(options = {})
    super(:x =>rand * 800, :y =>rand * 600, :image => Image["php.png"], :width =>50, :height =>50)

    self.factor = 1.5 #$window.factor
    @sound = Sound["grenade.wav"]
    update
  end

  def update
    self.draw
  end

  def hit_by(object)
    @sound.play
  end
end

