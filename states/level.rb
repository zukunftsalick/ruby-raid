class Level < Chingu::GameState
  def initialize(options = {})
    super
    @train = Train.create(:x => 350, :y => 350, :image => Image["media/ruby-100.png"],
    :width =>50, :height =>50, :zorder => 12)
    @background_image = Image["media/space.png"]
  end
  
  def update
    super
    Java.create.draw if rand(100) < 4 && Java.all.size < 10
    @train.each_bounding_box_collision(Java) do |player, enemy|
      player.hit_by(enemy)
      enemy.hit_by(player)
    end
  end

  def draw
    @background_image.draw(0,0,0)
  end
end