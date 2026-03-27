=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Подъем по лестнице с ограничениями: динамическое программирование ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # Инициализация таблицы dp для хранения решений подзадач
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # Начальное состояние: заранее задать решения наименьших подзадач
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # Переход состояний: постепенное решение больших подзадач через меньшие
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "Количество способов подняться по лестнице из #{n} ступеней: #{res}"
end
