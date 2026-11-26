=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 키-값 쌍 ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### 배열로 구현한 해시 테이블 ###
class ArrayHashMap
  ### 생성자 ###
  def initialize
    # 버킷 100개로 배열 초기화
    @buckets = Array.new(100)
  end

  ### 해시 함수 ###
  def hash_func(key)
    index = key % 100
  end

  ### 조회 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 추가 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 삭제 ###
  def remove(key)
    index = hash_func(key)
    # nil로 설정하여 삭제를 나타냄
    @buckets[index] = nil
  end

  ### 모든 키-값 쌍 가져오기 ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### 모든 키 가져오기 ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### 모든 값 가져오기 ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### 해시 테이블 출력 ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hmap = ArrayHashMap.new

  # 추가
  # 해시 테이블에 키-값 쌍 (key, value) 추가
  hmap.put(12836, "샤오하")
  hmap.put(15937, "샤오뤄")
  hmap.put(16750, "샤오쑤안")
  hmap.put(13276, "샤오파")
  hmap.put(10583, "샤오야")
  puts "\n추가 후 해시 테이블\nKey -> Value"
  hmap.print

  # 조회
  # 해시 테이블에 키 key를 입력하여 값 value 조회
  name = hmap.get(15937)
  puts "\n학번 15937로 조회한 이름: #{name}"

  # 삭제
  # 해시 테이블에서 키-값 쌍 (key, value) 삭제
  hmap.remove(10583)
  puts "\n키 10583 삭제 후 해시 테이블\nKey -> Value"
  hmap.print

  # 해시 테이블 순회
  puts "\n키-값 쌍 순회 Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\n키만 순회 Key"
  for key in hmap.key_set
    puts key
  end

  puts "\n값만 순회 Value"
  for val in hmap.value_set
    puts val
  end
end
