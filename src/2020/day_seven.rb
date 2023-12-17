# frozen_string_literal: true

class DaySeven2020
  def self.part_one(lines)
    bags = create_bags(lines)
    find_bags(bags, "shiny gold", Set.new).size
  end

  def self.part_two(lines)
    bags = create_bags(lines)
    find_total_bags(bags, "shiny gold", 1) - 1
  end

  class << self
    def create_bags(lines)
      lines.each_with_object({}) do |line, acc|
        name, rest = line.split(" bags contain ")
        next if rest == "no other bags."

        bags = rest.split(",")
        acc[name] = bags.each_with_object({}) do |bag, bags_acc|
          qty, type, color = bag.scan(/(\d+) (\w+) (\w+)/).flatten
          bags_acc["#{type} #{color}"] = qty.to_i
        end
      end
    end

    def find_bags(bags, name, seen)
      more_bags = bags.filter do |_bag, other_bags|
        other_bags.keys.any? { |bag_name| bag_name.include? name }
      end

      return seen if more_bags.empty?

      more_bags.each_key do |bag_name|
        seen << bag_name
        find_bags(bags, bag_name, seen)
      end
      seen
    end

    def find_total_bags(bags, name, qty)
      more_bags = bags.filter { |bag, _other_bags| bag == name }

      return qty if more_bags.empty?

      more_bags.values.sum do |items|
        qty + items.sum do |bag_name, value|
          qty * find_total_bags(bags, bag_name, value)
        end
      end
    end
  end
end
