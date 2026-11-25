=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 백트래킹: 부분집합의 합 I ###
def backtrack(state, target, total, choices, res)
  # 부분집합의 합이 target과 같으면 해를 기록한다
  if total == target
    res << state.dup
    return
  end

  # 모든 선택지를 순회한다
  for i in 0...choices.length
    # 가지치기: 부분집합의 합이 target을 초과하면 이 선택을 건너뛴다
    next if total + choices[i] > target
    # 시도: 원소를 선택하고 원소의 합 total을 갱신한다
    state << choices[i]
    # 다음 선택을 진행한다
    backtrack(state, target, total + choices[i], choices, res)
    # 되돌리기: 선택을 취소하고 이전 상태를 복원한다
    state.pop
  end
end

### 부분집합의 합 I 풀기(중복 부분집합 포함)###
def subset_sum_i_naive(nums, target)
  state = [] # 상태(부분집합)
  total = 0 # 부분집합의 합
  res = [] # 결과 리스트(부분집합의 리스트)
  backtrack(state, target, total, nums, res)
  res
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "입력 배열 nums = #{nums}, target = #{target}"
  puts "목표 합 #{target}에 맞는 모든 부분집합 res = #{res}"
  puts "이 방법의 결과에는 중복된 집합이 포함된다"
end
