# frozen_string_literal: true

class RopeNode
  attr_accessor :next, :value

  def initialize(value)
    @value = value
  end
end
