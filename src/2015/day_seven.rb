# frozen_string_literal: true

require_relative "models/circuit"

class DaySeven2015
  def self.part_one(instructions)
    circuit = Circuit.new
    instructions.each { |instruction| circuit.add(instruction) }
    circuit.a
  end

  def self.part_two(instructions)
    circuit = Circuit.new
    instructions.each { |instruction| circuit.add(instruction) }
    circuit.a
  end
end
