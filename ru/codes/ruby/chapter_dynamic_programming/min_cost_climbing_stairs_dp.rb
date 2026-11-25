=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Минимальная стоимость подъёма: динамическое программирование ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # Создать таблицу dp для решений подзадач
  dp = Array.new(n + 1, 0)
  # Начальные состояния: задать решения простейших подзадач
  dp[1], dp[2] = cost[1], cost[2]
  # Переход: решать подзадачи от меньших к большим
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

### Минимальная стоимость подъёма: динамическое программирование с экономией памяти ###
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### Основная программа ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "Стоимость ступеней: #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "Минимальная стоимость подъёма: #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "Минимальная стоимость подъёма: #{res}"
end
