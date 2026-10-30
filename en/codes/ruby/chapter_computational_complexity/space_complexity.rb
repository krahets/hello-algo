=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Function ###
def function
  # Perform some operations
  0
end

### Constant complexity ###
def constant(n)
  # Constants, variables, and objects occupy O(1) space
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # Variables in the loop occupy O(1) space
  (0...n).each { c = 0 }
  # Function calls in the loop occupy O(1) space
  (0...n).each { function }
end

### Linear complexity ###
def linear(n)
  # A list of length n occupies O(n) space
  nums = Array.new(n, 0)

  # A hash table with n entries occupies O(n) space
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### Linear complexity (recursive implementation)###
def linear_recur(n)
  puts "Recursion: n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### Quadratic complexity ###
def quadratic(n)
  # The two-dimensional list occupies O(n^2) space
  Array.new(n) { Array.new(n, 0) }
end

### Quadratic complexity (recursive implementation)###
def quadratic_recur(n)
  return 0 unless n > 0

  # The lengths of array nums are n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### Exponential complexity (building a perfect binary tree)###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### Driver code ###
if __FILE__ == $0
  n = 5

  # Constant complexity
  constant(n)

  # Linear complexity
  linear(n)
  linear_recur(n)

  # Quadratic complexity
  quadratic(n)
  quadratic_recur(n)

  # Exponential complexity
  root = build_tree(n)
  print_tree(root)
end
