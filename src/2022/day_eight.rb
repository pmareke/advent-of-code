# frozen_string_literal: true

class DayEight2022
  def self.part_one(lines)
    trees = lines.reduce([]) { |acc, line| acc << line.map(&:to_i) }
    trees.each_with_index.with_object([]) do |(row, idx), acc|
      row.each_with_index do |tree, idy|
        neighbords = trees[0...idx].map { |t| t[idy] }
        acc << [idx, idy] if neighbords.all? { |neighbord| neighbord < tree }

        neighbords = trees[idx.next..].map { |t| t[idy] }
        acc << [idx, idy] if neighbords.all? { |neighbord| neighbord < tree }

        neighbords = trees[idx][0...idy]
        acc << [idx, idy] if neighbords.all? { |neighbord| neighbord < tree }

        neighbords = trees[idx][idy.next..]
        acc << [idx, idy] if neighbords.all? { |neighbord| neighbord < tree }
      end
    end.uniq.size
  end

  def self.part_two(lines)
    trees = lines.reduce([]) { |acc, line| acc << line.map(&:to_i) }
    trees.each_with_index.with_object([]) do |(row, idx), acc|
      row.each_with_index do |tree, idy|
        tmp = []
        neighbords = trees[0...idx].map { |t| t[idy] }.reverse
        indexes = neighbords.find_index { |neighbord| neighbord >= tree }
        tmp << if indexes.nil?
                 neighbords.size
               else
                 indexes + 1
               end

        neighbords = trees[idx.next..].map { |t| t[idy] }
        indexes = neighbords.find_index { |neighbord| neighbord >= tree }
        tmp << if indexes.nil?
                 neighbords.size
               else
                 indexes + 1
               end

        neighbords = trees[idx][0...idy].reverse
        indexes = neighbords.find_index { |neighbord| neighbord >= tree }
        tmp << if indexes.nil?
                 neighbords.size
               else
                 indexes + 1
               end

        neighbords = trees[idx][idy.next..]
        indexes = neighbords.find_index { |neighbord| neighbord >= tree }
        tmp << if indexes.nil?
                 neighbords.size
               else
                 indexes + 1
               end

        acc << tmp.reduce(&:*)
      end
    end.max
  end
end
