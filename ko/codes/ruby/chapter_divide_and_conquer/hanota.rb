=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원판 하나를 옮긴다 ###
def move(src, tar)
  # src 맨 위의 원판 하나를 꺼낸다
  pan = src.pop
  # 원판을 tar 맨 위에 놓는다
  tar << pan
end

### 하노이의 탑 문제 f(i)를 푼다 ###
def dfs(i, src, buf, tar)
  # src에 원판 하나만 남으면 바로 tar로 옮긴다
  if i == 1
    move(src, tar)
    return
  end

  # 부분 문제 f(i-1): tar를 보조 기둥으로 써서 src 위의 원판 i-1개를 buf로 옮긴다
  dfs(i - 1, src, tar, buf)
  # 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
  move(src, tar)
  # 부분 문제 f(i-1): src를 보조 기둥으로 써서 buf 위의 원판 i-1개를 tar로 옮긴다
  dfs(i - 1, buf, src, tar)
end

### 하노이의 탑 문제 풀기 ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # B를 보조 기둥으로 써서 A 위의 원판 n개를 C로 옮긴다
  dfs(n, _A, _B, _C)
end

### 실행 코드 ###
if __FILE__ == $0
  # 리스트의 끝이 기둥의 맨 위에 해당한다
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "초기 상태:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "원판 이동 완료 후:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
