=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 백트래킹 알고리즘: 부분 집합 합 II ###
def backtrack(state, target, choices, start, res)
  # 부분 집합의 합이 target과 같으면 해를 기록한다
  if target.zero?
    res << state.dup
    return
  end

  # 모든 선택지를 순회한다
  # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
  # 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
  for i in start...choices.length
    # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
    # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
    break if target - choices[i] < 0
    # 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
    next if i > start && choices[i] == choices[i - 1]
    # 시도: 선택하고 target, start를 갱신한다
    state << choices[i]
    # 다음 선택을 진행한다
    backtrack(state, target - choices[i], choices, i + 1, res)
    # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
    state.pop
  end
end

### 부분 집합 합 II 풀기 ###
def subset_sum_ii(nums, target)
  state = [] # 상태(부분 집합)
  nums.sort! # nums를 정렬한다
  start = 0 # 순회 시작 위치
  res = [] # 결과 리스트(부분 집합 리스트)
  backtrack(state, target, nums, start, res)
  res
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "입력 배열 nums = #{nums}, target = #{target}"
  puts "합이 #{target}인 모든 부분 집합 res = #{res}"
end
