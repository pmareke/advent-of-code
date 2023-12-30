# frozen_string_literal: true

class Bot
  attr_accessor :input, :name

  def initialize(name)
    @name = name
    @input = []
  end

  def number
    name.split.last.to_i
  end

  def receives(value)
    @input << value.to_i

    check_receivers
  end

  def gives_low(bot)
    @out_lo = bot
    check_receivers
  end

  def gives_high(bot)
    @out_hi = bot
    check_receivers
  end

  def check_receivers
    return unless @out_lo && @out_hi && @input.size == 2

    lo, hi = @input.minmax
    @out_lo.receives lo
    @out_hi.receives hi
  end
end
