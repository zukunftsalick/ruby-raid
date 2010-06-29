class Java < Chingu::GameObject
  trait :bounding_circle
  trait :collision_detection

  def initialize(options={})
    super(:zorder=>1, :image => Image["files/ruby-100.png"])

    self.x =rand * 800
    self.y =rand * 600

    cache_bounding_circle
  end
end

