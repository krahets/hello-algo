/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    var size: Int // 키-값 쌍 개수
    var capacity: Int // 해시 테이블 용량
    var loadThres: Double // 용량 확장을 수행하는 적재율 임계값
    var extendRatio: Int // 용량 확장 배수
    var buckets: [Pair?] // 버킷 배열
    var TOMBSTONE: Pair // 삭제 표시

    /* 생성자 */
    init() {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = Array(repeating: nil, count: capacity)
        TOMBSTONE = Pair(key: -1, val: "-1")
    }

    /* 해시 함수 */
    func hashFunc(key: Int) -> Int {
        key % capacity
    }

    /* 적재율 */
    func loadFactor() -> Double {
        Double(size) / Double(capacity)
    }

    /* key에 해당하는 버킷 인덱스 탐색 */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while buckets[index] != nil {
            // key를 만나면 해당 버킷 인덱스를 반환한다
            if buckets[index]!.key == key {
                // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 옮긴 후의 버킷 인덱스를 반환한다
                }
                return index // 버킷 인덱스를 반환한다
            }
            // 처음 만난 삭제 표시를 기록한다
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % capacity
        }
        // key가 없으면 추가할 위치의 인덱스를 반환한다
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 조회 연산 */
    func get(key: Int) -> String? {
        // key에 해당하는 버킷 인덱스 탐색
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 해당 val을 반환한다
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // 키-값 쌍이 없으면 null을 반환한다
        return nil
    }

    /* 추가 연산 */
    func put(key: Int, val: String) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if loadFactor() > loadThres {
            extend()
        }
        // key에 해당하는 버킷 인덱스 탐색
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 삭제 연산 */
    func remove(key: Int) {
        // key에 해당하는 버킷 인덱스 탐색
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* 해시 테이블 용량 확장 */
    func extend() {
        // 원래 해시 테이블을 임시로 저장한다
        let bucketsTmp = buckets
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
        for pair in bucketsTmp {
            if let pair, pair != TOMBSTONE {
                put(key: pair.key, val: pair.val)
            }
        }
    }

    /* 해시 테이블 출력 */
    func print() {
        for pair in buckets {
            if pair == nil {
                Swift.print("null")
            } else if pair == TOMBSTONE {
                Swift.print("TOMBSTONE")
            } else {
                Swift.print("\(pair!.key) -> \(pair!.val)")
            }
        }
    }
}

@main
enum _HashMapOpenAddressing {
    /* 실행 코드 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n16750을 삭제한 후의 해시 테이블\n키 -> 값")
        map.print()
    }
}
