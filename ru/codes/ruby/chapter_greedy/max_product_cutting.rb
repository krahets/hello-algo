=begin
File: max_product_cutting.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Максимальное произведение при разбиении: жадный алгоритм ###
def max_product_cutting(n)
  # При n <= 3 одно из слагаемых обязательно равно 1
  return 1 * (n - 1) if n <= 3
  # Выделяем тройки жадно: a — число троек, b — остаток
  a, b = n / 3, n % 3
  # При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
  return (3.pow(a - 1) * 2 * 2).to_i if b == 1
  # При остатке 2 ничего не меняем
  return (3.pow(a) * 2).to_i if b == 2
  # При остатке 0 ничего не меняем
  3.pow(a).to_i
end

### Пример запуска ###
if __FILE__ == $0
  n = 58

  # Жадный алгоритм
  res = max_product_cutting(n)
  puts "Максимальное произведение при разбиении: #{res}"
end
