=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Подъем по лестнице: динамическое программирование ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # Инициализация таблицы dp для хранения решений подзадач
  dp = Array.new(n + 1, 0)
  # Начальное состояние: заранее задать решения наименьших подзадач
  dp[1], dp[2] = 1, 2
  # Переход состояний: постепенное решение больших подзадач через меньшие
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

# ## Подъем по лестнице: динамическое программирование с оптимизацией памяти ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "Количество способов подняться по лестнице из #{n} ступеней: #{res}"

  res = climbing_stairs_dp_comp(n)
  puts "Количество способов подняться по лестнице из #{n} ступеней: #{res}"
end
