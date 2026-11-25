=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 백트래킹 ###
def backtrack(choices, state, n, res)
  # n번째 계단에 도달하면 방법 수를 1 늘린다
  res[0] += 1 if state == n
  # 모든 선택지 순회
  for choice in choices
    # 가지치기: n번째 계단을 넘지 않는다
    next if state + choice > n

    # 시도: 선택한 뒤 상태를 갱신한다
    backtrack(choices, state + choice, n, res)
  end
  # 선택 취소
end

### 계단 오르기: 백트래킹 ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # 한 번에 한 계단 또는 두 계단을 오른다
  state = 0 # 0번째 계단에서 출발한다
  res = [0] # res[0]에 방법 수를 기록한다
  backtrack(choices, state, n, res)
  res.first
end

### 실행 예제 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "계단 #{n}개를 오르는 방법은 #{res}가지"
end
