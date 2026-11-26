=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 체이닝 해시 테이블 ###
class HashMapChaining
  ### 생성자 ###
  def initialize
    @size = 0 # 키-값 쌍의 개수
    @capacity = 4 # 해시 테이블의 용량
    @load_thres = 2.0 / 3.0 # 용량을 늘리는 기준이 되는 적재율
    @extend_ratio = 2 # 용량 증가 배수
    @buckets = Array.new(@capacity) { [] } # 버킷 배열
  end

  ### 해시 함수 ###
  def hash_func(key)
    key % @capacity
  end

  ### 적재율 ###
  def load_factor
    @size / @capacity.to_f
  end

  ### 조회 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하다가 key를 찾으면 해당 val 반환
    for pair in bucket
      return pair.val if pair.key == key
    end
    # key를 찾지 못하면 nil 반환
    nil
  end

  ### 추가 ###
  def put(key, val)
    # 적재율이 임계값을 넘으면 용량 늘리기
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 삭제 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하며 해당 키-값 쌍 삭제
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### 해시 테이블 용량 늘리기 ###
  def extend
    # 기존 해시 테이블 임시 보관
    buckets = @buckets
    # 용량을 늘린 새 해시 테이블 초기화
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### 해시 테이블 출력 ###
  def print
    for bucket in @buckets
      res = []
      for pair in bucket
        res << "#{pair.key} -> #{pair.val}"
      end
      pp res
    end
  end
end

### 실행 예제 ###
if __FILE__ == $0
  ### 해시 테이블 초기화
  hashmap = HashMapChaining.new

  # 추가
  # 해시 테이블에 키-값 쌍 (key, value) 추가
  hashmap.put(12836, "샤오하")
  hashmap.put(15937, "샤오뤄")
  hashmap.put(16750, "샤오쑤안")
  hashmap.put(13276, "샤오파")
  hashmap.put(10583, "샤오야")
  puts "\n추가 후 해시 테이블\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 조회
  # 해시 테이블에 키 key를 입력하여 값 value 조회
  name = hashmap.get(13276)
  puts "\n학번 13276으로 조회한 이름: #{name}"

  # 삭제
  # 해시 테이블에서 키-값 쌍 (key, value) 삭제
  hashmap.remove(12836)
  puts "\n키 12836 삭제 후 해시 테이블\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
