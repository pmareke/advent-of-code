# frozen_string_literal: true

require_relative "models/folder"

class DaySeven2022
  def self.part_one(lines)
    directories = create_directories(lines)
    sizes = directories.map(&:total_size)
    sizes.filter { |folder| folder <= 100_000 }.sum
  end

  def self.part_two(lines)
    directories = create_directories(lines)
    sizes = directories.map(&:total_size)
    free_space = 70_000_000 - directories.first.total_size
    sizes.filter { |size| free_space + size >= 30_000_000 }.min
  end

  class << self
    def create_directories(lines)
      folders = []
      lines.each_with_object([]) do |line, acc|
        next if line.start_with? "$ ls"
        next if line.start_with? "dir"

        if line.start_with? "$ cd .."
          folders.pop
          next
        end

        if line.start_with? "$ cd "
          current_folder = folders.last
          folder = Folder.new
          acc << folder
          current_folder.folders << folder if current_folder
          folders << folder
          next
        end

        size = line.split.first.to_i
        current_folder = folders.last
        current_folder.size += size
      end
    end
  end
end
