#!/usr/bin/env ruby
require 'rubygems'
require "chingu"
Dir["characters/*.rb"].each {|file| require file }
include Gosu

class RubyRaid < Chingu::Window
  def initialize
    super(800,600,false)
    self.input = { :escape => :exit }

    @train = Train.create(:x => 350, :y => 350, :image => Image["media/ruby-100.png"],
      :width =>50, :height =>50)

    @background_image = Gosu::Image.new(self, "media/space.png", true)
  end

  def update
    super
    self.caption = "Ruby-Raid"

    if rand(100) < 4 && Java.all.size < 25
      Java.create
    end

    @train.each_bounding_box_collision(Java) do |player, enemy|
      enemy.height = 33
      enemy.width = 33
      enemy.image = Image["media/java_explode_2.png"]
      player.hit_by(enemy)
      enemy.hit_by(player)
      #@score+=10
    end
  end

  def draw
    @train.draw
    @background_image.draw(0, 0, 0);
  end

end


RubyRaid.new.show

