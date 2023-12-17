# frozen_string_literal: true

require_relative "models/node"
require "pqueue"

class DaySeven2018
  def self.part_one(lines)
    nodes = create_nodes(lines)
    roots = nodes.reject { |n| nodes.any? { |n2| n2.children.include? n } }.sort_by(&:value)
    queue = PQueue.new(roots) { |a, b| a.value < b.value }

    list = []
    until queue.empty?
      node = queue.pop
      list << node

      node.children.sort_by(&:value).each do |children|
        node.children.delete(children)
        queue << children unless nodes.any? { |another_node| another_node.children.include? children }
      end
    end

    list.map(&:value).join
  end

  def self.part_two(lines)
    nodes = create_nodes(lines)
    current_seconds = 0
    base_seconds = 60

    workers = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil }

    until nodes.empty?
      workers.compact.each do |id, job|
        next if job[1] != current_seconds

        workers[id] = nil
        nodes.delete(job[0])
      end

      workers.select { |_, job| job.nil? }.each_key do |id|
        work_node = nodes.find do |node|
          nodes.none? { |n2| n2.children.include? node } && !workers.values.compact.map(&:first).include?(node)
        end
        break unless work_node

        finish_time = current_seconds + work_node.ord - 64 + base_seconds
        workers[id] = [work_node, finish_time]
      end
      current_seconds += 1
    end
    current_seconds - 1
  end

  class << self
    def create_nodes(lines)
      raw_nodes = lines.each_with_object([]) do |line, acc|
        acc << line.scan(/(?:Step (\w) must be finished before step (\w) can begin.)/).flatten
      end

      raw_nodes.each_with_object([]) do |(before, after), acc|
        added = acc.map(&:value)
        acc << Node.new(before) unless added.include? before
        acc << Node.new(after) unless added.include? after

        before = acc.find { |node| node.value == before }
        after = acc.find { |node| node.value == after }

        before.children << after unless before.children.include? after
      end
    end
  end
end
