# frozen_string_literal: true

class Tower
  attr_reader :name
  attr_accessor :size, :towers, :parent

  def initialize(name)
    @name = name
    @size = 0
    @parent = nil
    @towers = []
  end

  def weight
    [size, *towers.map(&:weight)].sum
  end

  def <=>(other)
    weight <=> other.weight
  end

  def valid?
    true if towers.empty?

    towers.map(&:weight).uniq.size <= 1
  end
end
