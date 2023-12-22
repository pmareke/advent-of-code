# frozen_string_literal: true

class Circuit
  TRANSFORMS = {
    "LSHIFT" => "<<",
    "RSHIFT" => ">>",
    "NOT" => "~",
    "AND" => "&",
    "OR" => "|",
    /\b(if|do|in)\b/ => "\\1_",
  }.freeze

  def add(line)
    TRANSFORMS.each { |from, to| line.gsub!(from, to) }

    expr, name = line.split(" -> ")

    method = "def #{name}; @#{name} ||= #{expr}; end"

    eval method
  end
end
