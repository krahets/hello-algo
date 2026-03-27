=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Переместить один диск ###
def move(src, tar)
  # Снять диск с вершины src
  pan = src.pop
  # Положить диск на вершину tar
  tar << pan
end

# ## Решить задачу Ханойской башни f(i) ###
def dfs(i, src, buf, tar)
  # Если в src остался только один диск, сразу переместить его в tar
  if i == 1
    move(src, tar)
    return
  end

  # Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
  dfs(i - 1, src, tar, buf)
  # Подзадача f(1): переместить оставшийся один диск из src в tar
  move(src, tar)
  # Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
  dfs(i - 1, buf, src, tar)
end

# ## Решить задачу Ханойской башни ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # Переместить верхние n дисков из A в C с помощью B
  dfs(n, _A, _B, _C)
end

### Driver Code ###
if __FILE__ == $0
  # Хвост списка соответствует вершине столбца
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "Исходное состояние:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "После завершения перемещения дисков:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
