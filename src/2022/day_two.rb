# frozen_string_literal: true

class DayTwo2022
    def self.part_one(pairs)
        pairs.sum { |pair| match(pair) }
    end
  
    def self.part_two(pairs)
        pairs.sum { |pair| match_for_winner(pair) }
    end

    class << self
        def match(pair)
            extra_points = {X: 1, Y: 2, Z: 3}
            score(pair) + extra_points[pair[1].to_sym]
        end

        def score(pair)
            left, right = pair
            points = {
                A: {X: 3, Y: 6, Z: 0},
                B: {X: 0, Y: 3, Z: 6},
                C: {X: 6, Y: 0, Z: 3},
            }[left.to_sym][right.to_sym]
        end

        def match_for_winner(pair)
            extra_points = {X: 0, Y: 3, Z: 6}
            score_for_winner(pair) + extra_points[pair[1].to_sym]
        end

        def score_for_winner(pair)
            left, right = pair
            points = {
                Y: {A: 1, B: 2, C: 3},
                Z: {A: 2, B: 3, C: 1},
                X: {A: 3, B: 1, C: 2},
            }[right.to_sym][left.to_sym]
        end
    end
end