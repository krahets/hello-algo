/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 체이닝 해시 테이블 */
class HashMapChaining {
    var size: Int // 키-값 쌍 개수
    var capacity: Int // 해시 테이블 용량
    var loadThres: Double // 용량 확장을 수행하는 적재율 임계값
    var extendRatio: Int // 용량 확장 배수
    var buckets: [[Pair]] // 버킷 배열

    /* 생성자 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: [], count: capacity)
    }

    /* 해시 함수 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 적재율 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* 조회 연산 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // key를 찾지 못하면 nil을 반환한다
        return nil
    }

    /* 추가 연산 */
    func put(key: Int, val: String) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 삭제 연산 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하며 키-값 쌍을 삭제한다
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* 해시 테이블 용량 확장 */
    func extend() {
        // 원래 해시 테이블을 임시로 저장한다
        let bucketsTmp = buckets
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
        for bucket in bucketsTmp {
            for pair in bucket {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 해시 테이블 출력 */
    func print() {
        for bucket in buckets {
            let res = bucket.map { "\($0.key) -> \($0.val)" }
            Swift.print(res)
        }
    }
}

@main
enum _HashMapChaining {
    /* 실행 코드 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = HashMapChaining()

        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map.put(key: 12836, val: "小哈")
        map.put(key: 15937, val: "小啰")
        map.put(key: 16750, val: "小算")
        map.put(key: 13276, val: "小法")
        map.put(key: 10583, val: "小鸭")
        print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
        map.print()

        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        let name = map.get(key: 13276)
        print("\n학번 13276을 입력하여 조회한 이름 = \(name!)")

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.remove(key: 12836)
        print("\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값")
        map.print()
    }
}
