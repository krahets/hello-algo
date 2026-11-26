=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원소 num의 k번째 자릿값 구하기. 여기서 exp = 10^(k-1) ###
def digit(num, exp)
  # k 대신 exp를 전달하여 비용이 큰 거듭제곱 연산의 반복 방지
  (num / exp) % 10
end

### 계수 정렬(nums의 k번째 자릿값 기준)###
def counting_sort_digit(nums, exp)
  # 십진수 한 자리의 값은 0~9이므로 길이 10인 버킷 배열이 필요함
  counter = Array.new(10, 0)
  n = nums.length
  # 0~9의 각 숫자가 나타난 횟수 세기
  for i in 0...n
    d = digit(nums[i], exp) # nums[i]의 k번째 자릿값을 구해 d에 저장
    counter[d] += 1 # 숫자 d의 출현 횟수 세기
  end
  # 누적합을 구해 ‘출현 횟수’를 ‘배열 인덱스’로 변환
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # 역순으로 순회하며 버킷별 계수 결과에 따라 각 원소를 res에 채우기
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # 배열에서 d가 들어갈 인덱스 j 구하기
    res[j] = nums[i] # 현재 원소를 인덱스 j에 배치
    counter[d] -= 1 # d의 개수를 1 줄이기
  end
  # 결과로 원래 배열 nums를 덮어쓰기
  (0...n).each { |i| nums[i] = res[i] }
end

### 기수 정렬 ###
def radix_sort(nums)
  # 최대 자릿수를 알아내기 위해 배열의 최댓값 구하기
  m = nums.max
  # 낮은 자리부터 높은 자리까지 차례로 순회
  exp = 1
  while exp <= m
    # 배열 원소의 k번째 자릿값을 기준으로 계수 정렬 수행
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # 즉, exp = 10^(k-1)
    counting_sort_digit(nums, exp)
    exp *= 10
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 기수 정렬
  nums = [
    10546151,
    35663510,
    42865989,
    34862445,
    81883077,
    88906420,
    72429244,
    30524779,
    82060337,
    63832996,
  ]
  radix_sort(nums)
  puts "기수 정렬 후 nums = #{nums}"
end
