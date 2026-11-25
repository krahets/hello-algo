=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 계수 정렬 ###
def counting_sort_naive(nums)
  # 객체를 정렬할 수 없는 간단한 구현
  # 1. 배열의 최댓값 m 구하기
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 각 숫자의 출현 횟수 세기
  # counter[num]은 num의 출현 횟수
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### 계수 정렬 ###
def counting_sort(nums)
  # 객체도 정렬할 수 있는 안정 정렬의 전체 구현
  # 1. 배열의 최댓값 m 구하기
  m = nums.max
  # 2. 각 숫자의 출현 횟수 세기
  # counter[num]은 num의 출현 횟수
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
  # 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
  # 결과를 기록할 배열 res 초기화
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # num을 해당 인덱스에 배치
    counter[num] -= 1 # 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
  end
  # 결과 배열 res로 원래 배열 nums를 덮어쓰기
  (0...n).each { |i| nums[i] = res[i] }
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "계수 정렬(객체 정렬 불가) 후 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "계수 정렬 후 nums1 = #{nums1}"
end
