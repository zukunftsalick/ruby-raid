#!/usr/bin/env ruby
require 'rubygems'
require "chingu"
require 'train'
include Gosu

class RubyRaid < Chingu::Window
  def initialize
    super(800,600,false)
    self.input = { :escape => :exit }

    @train = Train.create(:x => 150, :y => 150, :image => Image["files/ruby-100.png"], :angle =>-135, :width =>50, :height =>50)
    @train.input = { :holding_left => :move_left, :holding_right => :move_right,
                      :holding_up => :move_up, :holding_down => :move_down }
  end

  def update
    super
    self.caption = "Ruby-Raid"
  end
end


RubyRaid.new.show

