=begin
File: space_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Функция ###
def function
  # Выполнить некоторые операции
  0
end

### Константная сложность ###
def constant(n)
  # Константы, переменные и объекты занимают O(1) памяти
  a = 0
  nums = [0] * 10000
  node = ListNode.new

  # Переменные цикла занимают O(1) памяти
  (0...n).each { c = 0 }
  # Вызовы функции в цикле требуют O(1) памяти
  (0...n).each { function }
end

### Линейная сложность ###
def linear(n)
  # Список длины n занимает O(n) памяти
  nums = Array.new(n, 0)

  # Хеш-таблица из n элементов занимает O(n) памяти
  hmap = {}
  for i in 0...n
    hmap[i] = i.to_s
  end
end

### Линейная сложность (рекурсия)###
def linear_recur(n)
  puts "Рекурсивный вызов: n = #{n}"
  return if n == 1
  linear_recur(n - 1)
end

### Квадратичная сложность ###
def quadratic(n)
  # Двумерный список занимает O(n^2) памяти
  Array.new(n) { Array.new(n, 0) }
end

### Квадратичная сложность (рекурсия)###
def quadratic_recur(n)
  return 0 unless n > 0

  # Длина массива nums принимает значения n, n-1, ..., 2, 1
  nums = Array.new(n, 0)
  quadratic_recur(n - 1)
end

### Экспоненциальная сложность (построение совершенного двоичного дерева)###
def build_tree(n)
  return if n == 0

  TreeNode.new.tap do |root|
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
  end
end

### Основная программа ###
if __FILE__ == $0
  n = 5

  # Константная сложность
  constant(n)

  # Линейная сложность
  linear(n)
  linear_recur(n)

  # Квадратичная сложность
  quadratic(n)
  quadratic_recur(n)

  # Экспоненциальная сложность
  root = build_tree(n)
  print_tree(root)
end
