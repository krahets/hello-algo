=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## константная сложность ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

# ## линейная сложность ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

# ## Линейная сложность (обход массива)###
def array_traversal(nums)
  count = 0

  # Число итераций пропорционально длине массива
  for num in nums
    count += 1
  end

  count
end

# ## квадратичная сложность ###
def quadratic(n)
  count = 0

  # Число итераций квадратично зависит от размера данных n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

# ## Квадратичная сложность (пузырьковая сортировка)###
def bubble_sort(nums)
  count = 0  # Счетчик

  # Внешний цикл: неотсортированный диапазон равен [0, i]
  for i in (nums.length - 1).downto(0)
    # Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # Обмен элементов включает 3 элементарные операции
      end
    end
  end

  count
end

# ## Экспоненциальная сложность (итеративная реализация)###
def exponential(n)
  count, base = 0, 1

  # На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

# ## Экспоненциальная сложность (рекурсивная реализация)###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

# ## Логарифмическая сложность (итеративная реализация)###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

# ## Логарифмическая сложность (рекурсивная реализация)###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

# ## линейно-логарифмическая сложность ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

# ## Факториальная сложность (рекурсивная реализация)###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # От одного разветвиться на n
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных типах сложности
  n = 8
  puts "Размер входных данных n = #{n}"

  count = constant(n)
  puts "Количество операций константной сложности = #{count}"

  count = linear(n)
  puts "Количество операций линейной сложности = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Количество операций линейной сложности (обход массива) = #{count}"

  count = quadratic(n)
  puts "Количество операций квадратичной сложности = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Количество операций квадратичной сложности (пузырьковая сортировка) = #{count}"

  count = exponential(n)
  puts "Количество операций экспоненциальной сложности (итеративная реализация) = #{count}"
  count = exp_recur(n)
  puts "Количество операций экспоненциальной сложности (рекурсивная реализация) = #{count}"

  count = logarithmic(n)
  puts "Количество операций логарифмической сложности (итеративная реализация) = #{count}"
  count = log_recur(n)
  puts "Количество операций логарифмической сложности (рекурсивная реализация) = #{count}"

  count = linear_log_recur(n)
  puts "Количество операций линейно-логарифмической сложности (рекурсивная реализация) = #{count}"

  count = factorial_recur(n)
  puts "Количество операций факториальной сложности (рекурсивная реализация) = #{count}"
end
