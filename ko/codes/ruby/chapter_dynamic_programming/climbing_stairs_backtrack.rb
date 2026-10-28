=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 백트래킹 ###
def backtrack(choices, state, n, res)
  # n번째 계단에 도달하면 방법의 수에 1을 더한다
  res[0] += 1 if state == n
  # 모든 선택지를 순회한다
  for choice in choices
    # 가지치기: n번째 계단을 넘어갈 수 없다
    next if state + choice > n

    # 시도: 선택하고 상태를 갱신한다
    backtrack(choices, state + choice, n, res)
  end
  # 되돌리기
end

### 계단 오르기: 백트래킹 ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 한 계단 또는 두 계단 오르기를 선택할 수 있다
  state = 0 # 0번째 계단에서 오르기 시작한다
  res = [0] # res[0]에 방법의 수를 기록한다
  backtrack(choices, state, n, res)
  res.first
end

### 실행 코드 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "#{n}개의 계단을 오르는 방법은 총 #{res}가지이다"
end
