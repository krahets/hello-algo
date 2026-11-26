/**
 * File: array_hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    private var buckets: [Pair?]

    init() {
        // 버킷 100개로 배열 초기화
        buckets = Array(repeating: nil, count: 100)
    }

    /* 해시 함수 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 조회 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 추가 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 삭제 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // nil로 설정하여 삭제를 나타냄
        buckets[index] = nil
    }

    /* 모든 키-값 쌍 가져오기 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* 모든 키 가져오기 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* 모든 값 가져오기 */
    func valueSet() -> [String] {
        buckets.compactMap { $0?.val }
    }

    /* 해시 테이블 출력 */
    func print() {
        for pair in pairSet() {
            Swift.print("\(pair.key) -> \(pair.val)")
        }
    }
}

@main
enum _ArrayHashMap {
    /* 실행 예제 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = ArrayHashMap()

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
        let name = map.get(key: 15937)!
        print("\n학번 15937로 조회한 이름: \(name)")

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.remove(key: 10583)
        print("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
        map.print()

        /* 해시 테이블 순회 */
        print("\n키-값 쌍 순회 Key->Value")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\n키만 순회 Key")
        for key in map.keySet() {
            print(key)
        }
        print("\n값만 순회 Value")
        for val in map.valueSet() {
            print(val)
        }
    }
}
