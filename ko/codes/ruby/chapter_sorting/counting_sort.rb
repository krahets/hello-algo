=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 계수 정렬 ###
def counting_sort_naive(nums)
  # 간단한 구현이며, 객체 정렬에는 사용할 수 없다
  # 1. 배열의 최댓값 m을 구한다
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 각 숫자의 등장 횟수를 센다
  # counter[num]은 num의 등장 횟수를 나타낸다
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
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
  # 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
  # 1. 배열의 최댓값 m을 구한다
  m = nums.max
  # 2. 각 숫자의 등장 횟수를 센다
  # counter[num]은 num의 등장 횟수를 나타낸다
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
  # 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
  # 결과를 기록할 배열 res를 초기화한다
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # num을 해당 인덱스에 배치한다
    counter[num] -= 1 # 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
  end
  # 결과 배열 res로 원래 배열 nums를 덮어쓴다
  (0...n).each { |i| nums[i] = res[i] }
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "계수 정렬(객체 정렬 불가)을 마친 후 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "계수 정렬을 마친 후 nums1 = #{nums1}"
end
