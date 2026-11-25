=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск ###
def dfs(i)
  # Для dp[1] и dp[2] вернуть известные значения
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### Подъём по лестнице: поиск ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### Основная программа ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "Число способов подняться на лестницу из #{n} ступеней: #{res}."
end
