=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Константная сложность ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### Линейная сложность ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### Линейная сложность (обход массива)###
def array_traversal(nums)
  count = 0

  # Число итераций пропорционально длине массива
  for num in nums
    count += 1
  end

  count
end

### Квадратичная сложность ###
def quadratic(n)
  count = 0

  # Число итераций пропорционально квадрату размера данных n
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### Квадратичная сложность (пузырьковая сортировка)###
def bubble_sort(nums)
  count = 0  # Счётчик

  # Внешний цикл: неотсортированный участок — [0, i]
  for i in (nums.length - 1).downto(0)
    # Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
    for j in 0...i
      if nums[j] > nums[j + 1]
        # Поменять местами nums[j] и nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # Обмен элементов состоит из трёх элементарных операций
      end
    end
  end

  count
end

### Экспоненциальная сложность (цикл)###
def exponential(n)
  count, base = 0, 1

  # На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### Экспоненциальная сложность (рекурсия)###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### Логарифмическая сложность (цикл)###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### Логарифмическая сложность (рекурсия)###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### Линейно-логарифмическая сложность ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### Факториальная сложность (рекурсия)###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # Разветвить одну задачу на n подзадач
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Основная программа ###
if __FILE__ == $0
  # Попробуйте менять n и следить за ростом числа операций при разной сложности
  n = 8
  puts "Размер входных данных n = #{n}"

  count = constant(n)
  puts "Число операций при константной сложности = #{count}"

  count = linear(n)
  puts "Число операций при линейной сложности = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "Число операций при линейной сложности (обход массива) = #{count}"

  count = quadratic(n)
  puts "Число операций при квадратичной сложности = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "Число операций при квадратичной сложности (пузырьковая сортировка) = #{count}"

  count = exponential(n)
  puts "Число операций при экспоненциальной сложности (цикл) = #{count}"
  count = exp_recur(n)
  puts "Число операций при экспоненциальной сложности (рекурсия) = #{count}"

  count = logarithmic(n)
  puts "Число операций при логарифмической сложности (цикл) = #{count}"
  count = log_recur(n)
  puts "Число операций при логарифмической сложности (рекурсия) = #{count}"

  count = linear_log_recur(n)
  puts "Число операций при линейно-логарифмической сложности (рекурсия) = #{count}"

  count = factorial_recur(n)
  puts "Число операций при факториальной сложности (рекурсия) = #{count}"
end
