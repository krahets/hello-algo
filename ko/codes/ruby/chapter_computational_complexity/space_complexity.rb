=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 함수 ###
def function
  # 몇 가지 연산을 수행한다
  0
end

### 상수 차수 ###
def constant(n)
  # 상수, 변수, 객체는 O(1) 공간을 차지한다
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # 반복문 안의 변수는 O(1) 공간을 차지한다
  (0...n).each { c = 0 }
  # 반복문 안의 함수는 O(1) 공간을 차지한다
  (0...n).each { function }
end

### 선형 차수 ###
def linear(n)
  # 길이가 n인 리스트는 O(n) 공간을 차지한다
  nums = Array.new(n, 0)

  # 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### 선형 차수(재귀 구현)###
def linear_recur(n)
  puts "재귀 n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### 제곱 차수 ###
def quadratic(n)
  # 이차원 리스트는 O(n^2) 공간을 차지한다
  Array.new(n) { Array.new(n, 0) }
end

### 제곱 차수(재귀 구현)###
def quadratic_recur(n)
  return 0 unless n > 0

  # 배열 nums의 길이는 n, n-1, ..., 2, 1이다
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### 지수 차수(포화 이진 트리 구성)###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### 실행 코드 ###
if __FILE__ == $0
  n = 5

  # 상수 차수
  constant(n)

  # 선형 차수
  linear(n)
  linear_recur(n)

  # 제곱 차수
  quadratic(n)
  quadratic_recur(n)

  # 지수 차수
  root = build_tree(n)
  print_tree(root)
end
