=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 函数 ###
def function
  # 执行某些操作
  0
end

### 常数阶 ###
def constant(n)
  # 常量、变量、对象占用 O(1) 空间
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # 循环中的变量占用 O(1) 空间
  (0...n).each { c = 0 }
  # 循环中的函数占用 O(1) 空间
  (0...n).each { function }
end

### 线性阶 ###
def linear(n)
  # 长度为 n 的列表占用 O(n) 空间
  nums = Array.new(n, 0)

  # 长度为 n 的哈希表占用 O(n) 空间
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### 线性阶（递归实现）###
def linear_recur(n)
  puts "递归 n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### 平方阶 ###
def quadratic(n)
  # 二维列表占用 O(n^2) 空间
  Array.new(n) { Array.new(n, 0) }
end

### 平方阶（递归实现）###
def quadratic_recur(n)
  return 0 unless n > 0

  # 数组 nums 长度为 n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### 指数阶（建立满二叉树）###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  # 常数阶
  constant(n)

  # 线性阶
  linear(n)
  linear_recur(n)

  # 平方阶
  quadratic(n)
  quadratic_recur(n)

  # 指数阶
  root = build_tree(n)
  print_tree(root)
end
