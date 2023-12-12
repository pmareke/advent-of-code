# frozen_string_literal: true

class Spring
  def initialize(springs, groups)
    @springs = springs
    @groups = groups
    @arrangements = {}
  end

  def arrangements(springs = @springs, groups = @groups)
    key = [springs, groups]
    return @arrangements[key] if @arrangements.key?(key)
    return (springs&.chars || []).all? { |p| p != "#" } ? 1 : 0 if groups.empty?

    damaged, *rest = groups
    after = rest.sum + rest.size

    @arrangements[key] = (springs.size - after - damaged + 1).times.sum do |before|
      candidate = (["."] * before) + (["#"] * damaged) + ["."]
      consistent?(candidate, springs) ? arrangements(springs[candidate.length..], rest) : 0
    end
  end

  def consistent?(candidate, springs = @record)
    candidate.each_with_index.all? do |item, idx|
      idx > (springs.length - 1) || springs[idx] == item || springs[idx] == "?"
    end
  end
end
