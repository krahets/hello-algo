=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Поиск с мемоизацией ###
def dfs(i, mem)
  # Для dp[1] и dp[2] вернуть известные значения
  return i if i == 1 || i == 2
  # Если dp[i] уже вычислено, вернуть сохранённое значение
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # Сохранить dp[i]
  mem[i] = count
end

### Подъём по лестнице: поиск с мемоизацией ###
def climbing_stairs_dfs_mem(n)
  # mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Основная программа ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "Число способов подняться на лестницу из #{n} ступеней: #{res}."
end
