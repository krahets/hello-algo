/**
 * File: hash_map_chaining.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 체이닝 해시 테이블 */
class HashMapChaining {
    var size: Int // 키-값 쌍의 개수
    var capacity: Int // 해시 테이블의 용량
    var loadThres: Double // 용량을 늘리는 기준이 되는 적재율
    var extendRatio: Int // 용량 증가 배수
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

    /* 조회 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for pair in bucket {
            if pair.key == key {
                return pair.val
            }
        }
        // key를 찾지 못하면 nil 반환
        return nil
    }

    /* 추가 */
    func put(key: Int, val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if loadFactor() > loadThres {
            extend()
        }
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for pair in bucket {
            if pair.key == key {
                pair.val = val
                return
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        let pair = Pair(key: key, val: val)
        buckets[index].append(pair)
        size += 1
    }

    /* 삭제 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        let bucket = buckets[index]
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (pairIndex, pair) in bucket.enumerated() {
            if pair.key == key {
                buckets[index].remove(at: pairIndex)
                size -= 1
                break
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    func extend() {
        // 기존 해시 테이블 임시 보관
        let bucketsTmp = buckets
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio
        buckets = Array(repeating: [], count: capacity)
        size = 0
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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
    /* 실행 예제 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = HashMapChaining()

        /* 추가 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        map.put(key: 12836, val: "샤오하")
        map.put(key: 15937, val: "샤오뤄")
        map.put(key: 16750, val: "샤오쑤안")
        map.put(key: 13276, val: "샤오파")
        map.put(key: 10583, val: "샤오야")
        print("\n추가 후 해시 테이블\nKey -> Value")
        map.print()

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        let name = map.get(key: 13276)
        print("\n학번 13276으로 조회한 이름: \(name!)")

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.remove(key: 12836)
        print("\n키 12836 삭제 후 해시 테이블\nKey -> Value")
        map.print()
    }
}
