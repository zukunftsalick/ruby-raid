class InitialScreen < Chingu::GameState
  def setup
    welcome = "Welcome to ruby-raid\n\n Press space to start"
    @text = Chingu::Text.create(welcome, :x => 180, :y => 150, :zorder => 15, :size => 50)
  end
  
  def draw
    super
    @text.draw
  end
end