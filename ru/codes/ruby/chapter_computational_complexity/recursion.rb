=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Рекурсия ###
def recur(n)
  # Условие завершения
  return 1 if n == 1
  # Рекурсия: рекурсивный вызов
  res = recur(n - 1)
  # Возврат: вернуть результат
  n + res
end

# ## Имитация рекурсии итерацией ###
def for_loop_recur(n)
  # Использовать явный стек для имитации системного стека вызовов
  stack = []
  res = 0

  # Рекурсия: рекурсивный вызов
  for i in n.downto(0)
    # Имитировать «рекурсию» с помощью операции помещения в стек
    stack << i
  end
  # Возврат: вернуть результат
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

# ## Хвостовая рекурсия ###
def tail_recur(n, res)
  # Условие завершения
  return res if n == 0
  # Хвостовой рекурсивный вызов
  tail_recur(n - 1, res + n)
end

# ## Последовательность Фибоначчи: рекурсия ###
def fib(n)
  # Условие завершения: f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # Рекурсивный вызов f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # Вернуть результат f(n)
  res
end

### Driver Code ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\nРезультат суммирования в рекурсивной функции res = #{res}"

  res = for_loop_recur(n)
  puts "\nРезультат суммирования при имитации рекурсии res = #{res}"

  res = tail_recur(n, 0)
  puts "\nРезультат суммирования в хвостовой рекурсии res = #{res}"

  res = fib(n)
  puts "\n#{n}-й элемент последовательности Фибоначчи: #{res}"
end
