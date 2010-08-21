#!/usr/bin/env ruby
require 'rubygems'
require "chingu"
Dir["characters/*.rb", "states/*.rb"].each {|file| require file }
include Gosu

class RubyRaid < Chingu::Window
  attr_reader :factor

  def initialize
    super(800,600,false)
    switch_game_state(InitialScreen)
    self.input = { :escape => :exit, :space => :push }
    self.caption = "Ruby-Raid"

    retrofy
    transitional_game_state(Chingu::GameStates::FadeTo, :speed => 10) 
    
  end

  def push
    if current_game_state.is_a?(InitialScreen)
      push_game_state(Level.new)
    elsif current_game_state.is_a?(Level)
      push_game_state(InitialScreen.new)
    end
  end
end

RubyRaid.new.show

