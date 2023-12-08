# frozen_string_literal: true

class Folder
  attr_accessor :size, :folders

  def initialize
    @size = 0
    @folders = []
  end

  def total_size
    @size + @folders.sum(&:total_size)
  end
end
