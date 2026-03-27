=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## рекурсия ###
def recur(n)
  # Условие завершения
  return 1 if n == 1
  # Рекурсивный шаг: выполнить рекурсивный вызов
  res = recur(n - 1)
  # Шаг возврата: вернуть результат
  n + res
end

# ## Имитировать рекурсию с помощью итерации ###
def for_loop_recur(n)
  # Использовать явный стек для имитации системного стека вызовов
  stack = []
  res = 0

  # Рекурсивный шаг: выполнить рекурсивный вызов
  for i in n.downto(0)
    # Смоделировать шаг «спуск» с помощью операции помещения в стек
    stack << i
  end
  # Шаг возврата: вернуть результат
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
  # Вызов хвостовой рекурсии
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
  puts "\nРезультат суммирования рекурсивной функции res = #{res}"

  res = for_loop_recur(n)
  puts "\nИмитировать рекурсию с помощью итерациисуммированиерезультат res = #{res}"

  res = tail_recur(n, 0)
  puts "\nРезультат суммирования хвостовой рекурсией res = #{res}"

  res = fib(n)
  puts "\n#{n}-й элемент последовательности Фибоначчи равен #{res}"
end
