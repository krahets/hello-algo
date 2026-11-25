=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Размен монет: жадный алгоритм ###
def coin_change_greedy(coins, amt)
  # Список coins предполагается отсортированным
  i = coins.length - 1
  count = 0
  # Повторяем жадный выбор, пока остаток суммы не обнулится
  while amt > 0
    # Ищем ближайший к остатку номинал среди меньших, чем остаток
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # Берём coins[i]
    amt -= coins[i]
    count += 1
  end
  # Если решения не нашлось, возвращаем -1
  amt == 0 ? count : -1
end

### Пример запуска ###
if __FILE__ == $0
  # Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Для суммы #{amt} минимальное число монет: #{res}"

  # Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Для суммы #{amt} минимальное число монет: #{res}"
  puts "На самом деле минимум — 3 монеты: 20 + 20 + 20"

  # Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Для суммы #{amt} минимальное число монет: #{res}"
  puts "На самом деле минимум — 2 монеты: 49 + 49"
end
