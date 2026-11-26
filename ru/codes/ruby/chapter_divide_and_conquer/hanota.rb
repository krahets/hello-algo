=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Перенос одного диска ###
def move(src, tar)
  # Снимаем верхний диск с src
  pan = src.pop
  # Кладём диск на вершину tar
  tar << pan
end

### Решение задачи о ханойских башнях f(i) ###
def dfs(i, src, buf, tar)
  # Если с src осталось перенести один диск, кладём его сразу на tar
  if i == 1
    move(src, tar)
    return
  end

  # Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
  dfs(i - 1, src, tar, buf)
  # Подзадача f(1): переносим оставшийся диск с src на tar
  move(src, tar)
  # Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
  dfs(i - 1, buf, src, tar)
end

### Решение задачи о ханойских башнях ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # Переносим n верхних дисков с A на C с помощью B
  dfs(n, _A, _B, _C)
end

### Основная программа ###
if __FILE__ == $0
  # Последний элемент списка соответствует вершине стержня
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "Исходное состояние:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "После переноса дисков:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
