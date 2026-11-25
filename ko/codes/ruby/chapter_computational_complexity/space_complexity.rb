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
  # 어떤 연산을 수행한다
  0
end

### 상수 차수 ###
def constant(n)
  # 상수, 변수, 객체가 O(1)의 공간을 차지한다
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # 반복문 안의 변수가 O(1)의 공간을 차지한다
  (0...n).each { c = 0 }
  # 반복문 안의 함수가 O(1)의 공간을 차지한다
  (0...n).each { function }
end

### 선형 차수 ###
def linear(n)
  # 길이 n인 리스트가 O(n)의 공간을 차지한다
  nums = Array.new(n, 0)

  # 길이 n인 해시 테이블이 O(n)의 공간을 차지한다
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### 선형 차수(재귀 구현)###
def linear_recur(n)
  puts "재귀 호출 n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### 이차 차수 ###
def quadratic(n)
  # 2차원 리스트가 O(n^2)의 공간을 차지한다
  Array.new(n) { Array.new(n, 0) }
end

### 이차 차수(재귀 구현)###
def quadratic_recur(n)
  return 0 unless n > 0

  # 배열 nums의 길이는 차례로 n, n-1, ..., 2, 1이다
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### 지수 차수(포화 이진 트리 생성)###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### 실행 예제 ###
if __FILE__ == $0
  n = 5

  # 상수 차수
  constant(n)

  # 선형 차수
  linear(n)
  linear_recur(n)

  # 이차 차수
  quadratic(n)
  quadratic_recur(n)

  # 지수 차수
  root = build_tree(n)
  print_tree(root)
end
