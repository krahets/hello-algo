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
        // 버킷 100개를 포함하는 배열을 초기화한다
        buckets = Array(repeating: nil, count: 100)
    }

    /* 해시 함수 */
    private func hashFunc(key: Int) -> Int {
        let index = key % 100
        return index
    }

    /* 조회 연산 */
    func get(key: Int) -> String? {
        let index = hashFunc(key: key)
        let pair = buckets[index]
        return pair?.val
    }

    /* 추가 연산 */
    func put(key: Int, val: String) {
        let pair = Pair(key: key, val: val)
        let index = hashFunc(key: key)
        buckets[index] = pair
    }

    /* 삭제 연산 */
    func remove(key: Int) {
        let index = hashFunc(key: key)
        // nil로 설정하여 삭제를 나타낸다
        buckets[index] = nil
    }

    /* 모든 키-값 쌍 반환 */
    func pairSet() -> [Pair] {
        buckets.compactMap { $0 }
    }

    /* 모든 키 반환 */
    func keySet() -> [Int] {
        buckets.compactMap { $0?.key }
    }

    /* 모든 값 반환 */
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
    /* 실행 코드 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = ArrayHashMap()

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
        let name = map.get(key: 15937)!
        print("\n학번 15937을 입력하여 조회한 이름 = \(name)")

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.remove(key: 10583)
        print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
        map.print()

        /* 해시 테이블 순회 */
        print("\n키-값 쌍(키->값) 순회")
        for pair in map.pairSet() {
            print("\(pair.key) -> \(pair.val)")
        }
        print("\n키 Key만 순회")
        for key in map.keySet() {
            print(key)
        }
        print("\n값 Value만 순회")
        for val in map.valueSet() {
            print(val)
        }
    }
}
