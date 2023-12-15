# frozen_string_literal: true

class Node
  attr_reader :value, :ord
  attr_accessor :children

  def initialize(value)
    @value = value
    @children = []
    @ord = value.ord
  end
end
