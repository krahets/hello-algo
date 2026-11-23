=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원판 하나 이동 ###
def move(src, tar)
  # src의 맨 위에서 원판 하나를 꺼낸다
  pan = src.pop
  # 원판을 tar의 맨 위에 놓는다
  tar << pan
end

### 하노이의 탑 문제 f(i) 풀기 ###
def dfs(i, src, buf, tar)
  # src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
  if i == 1
    move(src, tar)
    return
  end

  # 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
  dfs(i - 1, src, tar, buf)
  # 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
  move(src, tar)
  # 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
  dfs(i - 1, buf, src, tar)
end

### 하노이의 탑 문제 풀기 ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
  dfs(n, _A, _B, _C)
end

### 실행 코드 ###
if __FILE__ == $0
  # 리스트의 맨 뒤가 기둥의 맨 위이다
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "초기 상태:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "원판 이동을 마친 후:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
