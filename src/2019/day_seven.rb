# frozen_string_literal: true

require_relative "models/int_code"

class DaySeven2019
  def self.part_one(numbers)
    5.times.to_a.permutation.reduce([]) do |total, phases|
      programs = 5.times.reduce([]) do |acc, i|
        acc << IntCode.new(numbers.clone, phases[i])
      end

      previous_output = 0
      programs.each do |program|
        program.input(previous_output)
        previous_output = program.run
      end
      total << previous_output
    end.max
  end

  def self.part_two(numbers)
    (5..9).to_a.permutation.reduce([]) do |total, phases|
      programs = 5.times.reduce([]) do |acc, i|
        acc << IntCode.new(numbers.clone, phases[i])
      end

      previous_output = 0
      until programs.any?(&:halted)
        programs.each do |program|
          program.input(previous_output)
          output = program.run_without_halt
          previous_output = output unless program.halted
        end
      end
      total << previous_output
    end.max
  end
end
