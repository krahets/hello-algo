=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 関数 ###
def function
  # 何らかの処理を行う
  0
end

### 定数オーダー ###
def constant(n)
  # 定数・変数・オブジェクトが使う領域は O(1)
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # ループ内の変数が使う領域は O(1)
  (0...n).each { c = 0 }
  # ループ内の関数が使う領域は O(1)
  (0...n).each { function }
end

### 線形オーダー ###
def linear(n)
  # 長さ n のリストが使う領域は O(n)
  nums = Array.new(n, 0)

  # 長さ n のハッシュテーブルが使う領域は O(n)
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### 線形オーダー（再帰による実装）###
def linear_recur(n)
  puts "再帰 n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### 二次オーダー ###
def quadratic(n)
  # 二次元リストが使う領域は O(n^2)
  Array.new(n) { Array.new(n, 0) }
end

### 二次オーダー（再帰による実装）###
def quadratic_recur(n)
  return 0 unless n > 0

  # 配列 nums の長さは順に n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### 指数オーダー（すべての葉が同じ深さの完全二分木を構築）###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### 実行例 ###
if __FILE__ == $0
  n = 5

  # 定数オーダー
  constant(n)

  # 線形オーダー
  linear(n)
  linear_recur(n)

  # 二次オーダー
  quadratic(n)
  quadratic_recur(n)

  # 指数オーダー
  root = build_tree(n)
  print_tree(root)
end
