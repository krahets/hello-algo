=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 函式 ###
def function
  # 執行某些操作
  0
end

### 常數階 ###
def constant(n)
  # 常數、變數、物件佔用 O(1) 空間
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # 迴圈中的變數佔用 O(1) 空間
  (0...n).each { c = 0 }
  # 迴圈中的函式佔用 O(1) 空間
  (0...n).each { function }
end

### 線性階 ###
def linear(n)
  # 長度為 n 的串列佔用 O(n) 空間
  nums = Array.new(n, 0)

  # 長度為 n 的雜湊表佔用 O(n) 空間
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### 線性階（遞迴實現）###
def linear_recur(n)
  puts "遞迴 n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### 平方階 ###
def quadratic(n)
  # 二維串列佔用 O(n^2) 空間
  Array.new(n) { Array.new(n, 0) }
end

### 平方階（遞迴實現）###
def quadratic_recur(n)
  return 0 unless n > 0

  # 陣列 nums 長度為 n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### 指數階（建立滿二元樹）###
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

  # 常數階
  constant(n)

  # 線性階
  linear(n)
  linear_recur(n)

  # 平方階
  quadratic(n)
  quadratic_recur(n)

  # 指數階
  root = build_tree(n)
  print_tree(root)
end
