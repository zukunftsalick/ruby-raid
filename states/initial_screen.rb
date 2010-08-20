class InitialScreen < Chingu::GameState
  def setup
    welcome = 'Welcome to ruby-raid '
    @text = Chingu::Text.create(welcome, :x => 180, :y => 150, :zorder => 15, :factor_x => 3.0, :factor_y => 3.0)
  end
  
  def draw
    super
    @text.draw
  end
end