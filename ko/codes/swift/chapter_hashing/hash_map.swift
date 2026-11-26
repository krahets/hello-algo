/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* 실행 예제 */
    static func main() {
        /* 해시 테이블 초기화 */
        var map: [Int: String] = [:]

        /* 추가 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        map[12836] = "샤오하"
        map[15937] = "샤오뤄"
        map[16750] = "샤오쑤안"
        map[13276] = "샤오파"
        map[10583] = "샤오야"
        print("\n추가 후 해시 테이블\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        let name = map[15937]!
        print("\n학번 15937로 조회한 이름: \(name)")

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.removeValue(forKey: 10583)
        print("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
        PrintUtil.printHashMap(map: map)

        /* 해시 테이블 순회 */
        print("\n키-값 쌍 순회 Key->Value")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\n키만 순회 Key")
        for key in map.keys {
            print(key)
        }
        print("\n값만 순회 Value")
        for value in map.values {
            print(value)
        }
    }
}
