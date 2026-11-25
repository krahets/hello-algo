=begin
File: recursion.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Рекурсия ###
def recur(n)
  # Условие остановки
  return 1 if n == 1
  # Спуск: рекурсивный вызов
  res = recur(n - 1)
  # Возврат: передача результата
  n + res
end

### Моделирование рекурсии с помощью итерации ###
def for_loop_recur(n)
  # Смоделировать стек вызовов с помощью явного стека
  stack = []
  res = 0

  # Спуск: рекурсивный вызов
  for i in n.downto(0)
    # Добавление в стек моделирует спуск
    stack << i
  end
  # Возврат: передача результата
  while !stack.empty?
    res += stack.pop
  end

  # res = 1+2+3+...+n
  res
end

### Хвостовая рекурсия ###
def tail_recur(n, res)
  # Условие остановки
  return res if n == 0
  # Хвостовой рекурсивный вызов
  tail_recur(n - 1, res + n)
end

### Числа Фибоначчи: рекурсия ###
def fib(n)
  # Базовые случаи: f(1) = 0, f(2) = 1
  return n - 1 if n == 1 || n == 2
  # Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
  res = fib(n - 1) + fib(n - 2)
  # Вернуть результат f(n)
  res
end

### Основная программа ###
if __FILE__ == $0
  n = 5

  res = recur(n)
  puts "\nСумма при рекурсии: res = #{res}"

  res = for_loop_recur(n)
  puts "\nСумма при итеративном моделировании рекурсии: res = #{res}"

  res = tail_recur(n, 0)
  puts "\nСумма при хвостовой рекурсии: res = #{res}"

  res = fib(n)
  puts "\nЧисло Фибоначчи с номером #{n} равно #{res}"
end
