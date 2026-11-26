/**
 * File: hash_map_open_addressing.swift
 * Created Time: 2023-06-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    var size: Int // 키-값 쌍의 개수
    var capacity: Int // 해시 테이블의 용량
    var loadThres: Double // 용량을 늘리는 기준이 되는 적재율
    var extendRatio: Int // 용량 증가 배수
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

    /* key에 해당하는 버킷 인덱스 찾기 */
    func findBucket(key: Int) -> Int {
        var index = hashFunc(key: key)
        var firstTombstone = -1
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while buckets[index] != nil {
            // key를 만나면 해당 버킷 인덱스 반환
            if buckets[index]!.key == key {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if firstTombstone != -1 {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if firstTombstone == -1 && buckets[index] == TOMBSTONE {
                firstTombstone = index
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % capacity
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return firstTombstone == -1 ? index : firstTombstone
    }

    /* 조회 */
    func get(key: Int) -> String? {
        // key에 해당하는 버킷 인덱스 찾기
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 해당 val 반환
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            return buckets[index]!.val
        }
        // 키-값 쌍이 없으면 null 반환
        return nil
    }

    /* 추가 */
    func put(key: Int, val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if loadFactor() > loadThres {
            extend()
        }
        // key에 해당하는 버킷 인덱스 찾기
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index]!.val = val
            return
        }
        // 키-값 쌍이 없으면 새로 추가
        buckets[index] = Pair(key: key, val: val)
        size += 1
    }

    /* 삭제 */
    func remove(key: Int) {
        // key에 해당하는 버킷 인덱스 찾기
        let index = findBucket(key: key)
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if buckets[index] != nil, buckets[index] != TOMBSTONE {
            buckets[index] = TOMBSTONE
            size -= 1
        }
    }

    /* 해시 테이블 용량 늘리기 */
    func extend() {
        // 기존 해시 테이블 임시 보관
        let bucketsTmp = buckets
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio
        buckets = Array(repeating: nil, count: capacity)
        size = 0
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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
    /* 실행 예제 */
    static func main() {
        /* 해시 테이블 초기화 */
        let map = HashMapOpenAddressing()

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
        map.remove(key: 16750)
        print("\n키 16750 삭제 후 해시 테이블\nKey -> Value")
        map.print()
    }
}
