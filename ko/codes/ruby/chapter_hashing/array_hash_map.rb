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
    # 버킷 100개를 포함하는 배열을 초기화한다
    @buckets = Array.new(100)
  end

  ### 해시 함수 ###
  def hash_func(key)
    index = key % 100
  end

  ### 조회 연산 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 추가 연산 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 삭제 연산 ###
  def remove(key)
    index = hash_func(key)
    # nil로 설정하여 삭제를 나타낸다
    @buckets[index] = nil
  end

  ### 모든 키-값 쌍 반환 ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### 모든 키 반환 ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### 모든 값 반환 ###
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

### 실행 코드 ###
if __FILE__ == $0
  # 해시 테이블 초기화
  hmap = ArrayHashMap.new

  # 추가 연산
  # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
  hmap.put(12836, "小哈")
  hmap.put(15937, "小啰")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鸭")
  puts "\n추가를 마친 후의 해시 테이블\n키 -> 값"
  hmap.print

  # 조회 연산
  # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
  name = hmap.get(15937)
  puts "\n학번 15937을 입력하여 조회한 이름 #{name}"

  # 삭제 연산
  # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  hmap.remove(10583)
  puts "\n10583을 삭제한 후의 해시 테이블\n키 -> 값"
  hmap.print

  # 해시 테이블 순회
  puts "\n키-값 쌍(키->값) 순회"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\n키 Key만 순회"
  for key in hmap.key_set
    puts key
  end

  puts "\n값 Value만 순회"
  for val in hmap.value_set
    puts val
  end
end
