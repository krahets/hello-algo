=begin
File: coin_change_greedy.rb
Created Time: 2024-05-07
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Размен монет: жадный алгоритм ###
def coin_change_greedy(coins, amt)
  # Предположить, что список coins упорядочен
  i = coins.length - 1
  count = 0
  # Циклически выполнять жадный выбор, пока не останется суммы
  while amt > 0
    # Найти монету, которая меньше остатка суммы и наиболее к нему близка
    while i > 0 && coins[i] > amt
      i -= 1
    end
    # Выбрать coins[i]
    amt -= coins[i]
    count += 1
  end
  # Если допустимое решение не найдено, вернуть -1
  amt == 0 ? count : -1
end

### Driver Code ###
if __FILE__ == $0
  # Жадный подход: гарантирует нахождение глобально оптимального решения
  coins = [1, 5, 10, 20, 50, 100]
  amt = 186
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Минимальное количество монет для суммы #{amt}: #{res}"

  # Жадный подход: не гарантирует нахождение глобально оптимального решения
  coins = [1, 20, 50]
  amt = 60
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Минимальное количество монет для суммы #{amt}: #{res}"
  puts "На самом деле минимум равен 3: 20 + 20 + 20"

  # Жадный подход: не гарантирует нахождение глобально оптимального решения
  coins = [1, 49, 50]
  amt = 98
  res = coin_change_greedy(coins, amt)
  puts "\ncoins = #{coins}, amt = #{amt}"
  puts "Минимальное количество монет для суммы #{amt}: #{res}"
  puts "На самом деле минимум равен 2: 49 + 49"
end
