# frozen_string_literal: true

State = Struct.new(:workflow, :x, :m, :a, :s)

class DayNineteen2023
  def self.part_one(lines)
    parts = lines.split("\n\n")
    workflows = get_workflows(parts.first)
    ratings = get_ratings(parts.last)

    valid = ratings.filter do |rating|
      start = "in"
      until %w[R A].include?(start)
        rules = workflows[start]
        result = rules.find do |rule|
          expresion = "#{rating[rule.first.to_sym]}#{rule[1]}#{rule[2]}"
          rule.size == 1 || eval(expresion)
        end
        start = result.last
      end
      start == "A"
    end

    valid.map(&:values).sum { |values| values.map(&:to_i).sum }
  end

  def self.part_two(lines)
    parts = lines.split("\n\n")
    workflows = get_workflows(parts.first)
    accepted_rules = Set.new
    queue = [State.new("in", [1, 4000], [1, 4000], [1, 4000], [1, 4000])]
    until queue.empty?
      current = queue.shift
      if %w[R A].include?(current.workflow)
        accepted_rules << current if current.workflow == "A"
      else
        workflows[current.first].each do |rule|
          new_state = State.new(rule.last, current.x.dup, current.m.dup, current.a.dup, current.s.dup)
          if rule.size > 1
            if rule[1] == ">" # adjusting min
              current[rule.first.to_sym][1] = rule[2].to_i
              new_state[rule.first.to_sym][0] = rule[2].to_i + 1
            else # adjusting max
              new_state[rule.first.to_sym][1] = rule[2].to_i - 1
              current[rule.first.to_sym][0] = rule[2].to_i
            end
          end
          queue << new_state
        end
      end
    end
    accepted_rules.sum do |state|
      (state.x[1] - state.x[0] + 1) *
        (state.m[1] - state.m[0] + 1) *
        (state.a[1] - state.a[0] + 1) *
        (state.s[1] - state.s[0] + 1)
    end
  end

  class << self
    def get_workflows(workflow_list)
      workflow_list.split("\n").to_h do |workflow|
        name, rules = workflow.scan(/(\w+){(.*)}/).first
        rules = rules.split(",").map do |rule|
          if rule =~ /(\w+)(>|<)(\d+):(\w+)/
            [Regexp.last_match(1), Regexp.last_match(2), Regexp.last_match(3), Regexp.last_match(4)]
          else
            [rule]
          end
        end
        [name, rules]
      end
    end

    def get_ratings(ratings_list)
      ratings_list.split("\n").map { |part| %i[x m a s].zip(part.scan(/\d+/)).to_h }
    end
  end
end
