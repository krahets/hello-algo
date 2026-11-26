=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Подъём по лестнице: динамическое программирование ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # Создать таблицу dp для решений подзадач
  dp = Array.new(n + 1, 0)
  # Начальные состояния: задать решения простейших подзадач
  dp[1], dp[2] = 1, 2
  # Переход: решать подзадачи от меньших к большим
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### Подъём по лестнице: динамическое программирование с экономией памяти ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Основная программа ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "Число способов подняться на лестницу из #{n} ступеней: #{res}."

  res = climbing_stairs_dp_comp(n)
  puts "Число способов подняться на лестницу из #{n} ступеней: #{res}."
end
