# frozen_string_literal: true

require_relative "models/bot"

class DayTen2016
  def self.part_one(lines)
    bots = create_bots(lines)
    bots.values.find { |bot| bot.input.sort == [17, 61] }.number
  end

  def self.part_two(lines)
    bots = create_bots(lines)
    outputs = bots.values.select { |bot| bot.name =~ /output [012]$/ }
    outputs.map(&:input).map(&:first).reduce(:*)
  end

  class << self
    def create_bots(lines)
      bots = Hash.new { |hash, key| hash[key] = Bot.new(key) }
      lines.each_with_object(bots) do |line, _acc|
        case line
        when /(bot \d+) gives low to ((?:bot|output) \d+) and high to ((?:bot|output) \d+)/
          gives = bots[Regexp.last_match(1)]
          to_low = bots[Regexp.last_match(2)]
          to_high = bots[Regexp.last_match(3)]
          gives.gives_low(to_low)
          gives.gives_high(to_high)
        when /value (\d+) goes to (bot \d+)/
          value = Regexp.last_match(1)
          bot = bots[Regexp.last_match(2)]
          bot.receives(value)
        end
      end
    end
  end
end
