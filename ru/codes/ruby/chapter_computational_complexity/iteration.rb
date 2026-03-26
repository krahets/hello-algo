=begin
File: iteration.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com), Cy (9738314@gmail.com)
=end

# ## Цикл for ###
def for_loop(n)
  res = 0

  # В цикле вычислить сумму 1, 2, ..., n-1, n
  for i in 1..n
    res += i
  end

  res
end

# ## Цикл while ###
def while_loop(n)
  res = 0
  i = 1 # Инициализировать управляющую переменную

  # В цикле вычислить сумму 1, 2, ..., n-1, n
  while i <= n
    res += i
    i += 1 # Обновить управляющую переменную
  end

  res
end

# ## Цикл while (с двумя обновлениями)###
def while_loop_ii(n)
  res = 0
  i = 1 # Инициализировать управляющую переменную

  # В цикле вычислить сумму 1, 4, 10, ...
  while i <= n
    res += i
    # Обновить управляющую переменную
    i += 1
    i *= 2
  end

  res
end

# ## Двойной цикл for ###
def nested_for_loop(n)
  res = ""

  # Цикл i = 1, 2, ..., n-1, n
  for i in 1..n
    # Цикл j = 1, 2, ..., n-1, n
    for j in 1..n
      res += "(#{i}, #{j}), "
    end
  end

  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = for_loop(n)
  puts "\nРезультат суммирования в цикле for res = #{res}"

  res = while_loop(n)
  puts "\nРезультат суммирования в цикле while res = #{res}"

  res = while_loop_ii(n)
  puts "\nЦикл while (с двумя обновлениями)суммированиерезультат res = #{res}"

  res = nested_for_loop(n)
  puts "\nРезультат обхода двойным циклом for #{res}"
end
