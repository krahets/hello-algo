=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'

### 백트래킹: 순열 II ###
def backtrack(state, choices, selected, res)
  # 상태의 길이가 원소 개수와 같으면 해를 기록한다
  if state.length == choices.length
    res << state.dup
    return
  end

  # 모든 선택지를 순회한다
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
    if !selected[i] && !duplicated.include?(choice)
      # 시도: 하나를 선택하고 상태를 갱신한다
      duplicated.add(choice)
      selected[i] = true
      state << choice
      # 다음 선택을 진행한다
      backtrack(state, choices, selected, res)
      # 되돌리기: 선택을 취소하고 이전 상태를 복원한다
      selected[i] = false
      state.pop
    end
  end
end

### 순열 II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "입력 배열 nums = #{nums}"
  puts "모든 순열 res = #{res}"
end
