# frozen_string_literal: true

class LinkedListNode
  attr_accessor :value, :prev, :next

  def initialize(value, prev = nil, next_ = nil)
    @value = value
    @prev = prev || self
    @next = next_ || self
  end

  def insert_after(value)
    new_node = LinkedListNode.new(value, self, @next)
    @next.prev = new_node
    @next = new_node
    new_node
  end

  def delete
    @prev.next = @next
    @next.prev = @prev
    @next
  end
end
