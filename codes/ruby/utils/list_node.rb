=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# Definition for a singly-linked list node
class ListNode
  attr_accessor :val  # 节点值
  attr_accessor :next # 指向下一节点的引用

  def initialize(val=nil, next_node=nil)
    @val = val || 0
    @next = next_node
  end
end

class LinkedList
  class << self
    # Generate a linked list from an array
    #
    # @param [Array<Integer>] arr
    #
    # @return [ListNode] the root of the linked list
    def generate_from_array(arr)
      head = ListNode.new arr[0]
      current = head

      for i in 1...arr.length
        current.next = ListNode.new arr[i]
        current = current.next
      end
      
      head
    end

    # Get a list node with specific value from a linked list
    #
    # @param [ListNode] head
    # @param [Integer] val
    #
    # @return [ListNode] the node that contains the val
    def get_list_node(head, val)
      while !head.nil? && head.val != val
        head = head.next
      end

      head
    end
  end
end
