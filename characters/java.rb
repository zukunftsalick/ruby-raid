class Java < Chingu::GameObject
  trait :bounding_box
  trait :collision_detection
  traits :timer
  
  def initialize(options = {})
    super(:x =>rand * 800, :y =>rand * 600)

    @animation = Chingu::Animation.new(:file => "media/java_33x33.png", :delay => 100)
    @animation.frame_names = { :scan => 0..1, :explode => 2..11 }

    @frame_name = :scan
    self.factor = 1.5
    @sound = Sound["suckers.wav"]
    update
  end

  def update
    @image = @animation[@frame_name].next
    self.draw
  end

  def hit_by(object)
    @sound.play unless @sound_played?
    @sound_played? = true
    @frame_name = :explode
    @animation.delay = 1000
    after(1000) {self.destroy}
  end
end

