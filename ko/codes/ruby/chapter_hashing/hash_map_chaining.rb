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
    @size = 0 # 키-값 쌍 개수
    @capacity = 4 # 해시 테이블 용량
    @load_thres = 2.0 / 3.0 # 용량 확장을 수행하는 적재율 임계값
    @extend_ratio = 2 # 용량 확장 배수
    @buckets = Array.new(@capacity) { [] } # 버킷 배열
  end

  ### 해시 함수 ###
  def hash_func(key)
    key % @capacity
  end

  ### 적재율 ###
  def load_factor
    @size / @capacity
  end

  ### 조회 연산 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
    for pair in bucket
      return pair.val if pair.key == key
    end
    # key를 찾지 못하면 nil을 반환한다
    nil
  end

  ### 추가 연산 ###
  def put(key, val)
    # 적재율이 임계값을 초과하면 용량을 확장한다
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 삭제 연산 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 버킷을 순회하며 키-값 쌍을 삭제한다
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### 해시 테이블 용량 확장 ###
  def extend
    # 원래 해시 테이블을 임시로 저장한다
    buckets = @buckets
    # 용량을 확장한 새 해시 테이블을 초기화한다
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

### 실행 코드 ###
if __FILE__ == $0
  ### 해시 테이블 초기화
  hashmap = HashMapChaining.new

  # 추가 연산
  # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n추가를 마친 후의 해시 테이블\n[키1 -> 값1, 키2 -> 값2, ...]"
  hashmap.print

  # 조회 연산
  # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
  name = hashmap.get(13276)
  puts "\n학번 13276을 입력하여 조회한 이름 #{name}"

  # 삭제 연산
  # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
  hashmap.remove(12836)
  puts "\n12836을 삭제한 후의 해시 테이블\n[키1 -> 값1, 키2 -> 값2, ...]"
  hashmap.print
end
