=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 버킷 정렬 ###
def bucket_sort(nums)
  # 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 배열 원소를 각 버킷에 배분
  nums.each do |num|
    # 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
    i = (num * k).to_i
    # num을 버킷 i에 추가
    buckets[i] << num
  end

  # 2. 각 버킷을 정렬
  buckets.each do |bucket|
    # 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
    bucket.sort!
  end

  # 3. 버킷을 순회하여 결과 병합
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 입력은 [0, 1) 범위의 부동 소수점 수로 가정
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "버킷 정렬 후 nums = #{nums}"
end
