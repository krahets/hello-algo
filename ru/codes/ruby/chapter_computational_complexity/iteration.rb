=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

### Цикл for ###
def for_loop(n)
  res = 0

  # Сложить числа 1, 2, ..., n-1, n в цикле
  for i in 1..n
    res += i
  end

  res
end

### Цикл while ###
def while_loop(n)
  res = 0
  i = 1 # Задать начальное значение переменной условия

  # Сложить числа 1, 2, ..., n-1, n в цикле
  while i <= n
    res += i
    i += 1 # Обновить переменную условия
  end

  res
end

### Цикл while с двумя обновлениями###
def while_loop_ii(n)
  res = 0
  i = 1 # Задать начальное значение переменной условия

  # Сложить числа 1, 4, 10, ... в цикле
  while i <= n
    res += i
    # Обновить переменную условия
    i += 1
    i *= 2
  end

  res
end

### Вложенные циклы for ###
def nested_for_loop(n)
  res = ""

  # Перебрать i = 1, 2, ..., n-1, n
  for i in 1..n
    # Перебрать j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Основная программа ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nСумма в цикле for: res = #{res}"

  res = while_loop(n)
  puts "\nСумма в цикле while: res = #{res}"

  res = while_loop_ii(n)
  puts "\nСумма в цикле while с двумя обновлениями: res = #{res}"

  res = nested_for_loop(n)
  puts "\nРезультат обхода вложенными циклами for: #{res}"
end
