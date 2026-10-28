/**
 * File: hash_map.swift
 * Created Time: 2023-01-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum HashMap {
    /* 실행 코드 */
    static func main() {
        /* 해시 테이블 초기화 */
        var map: [Int: String] = [:]

        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map[12836] = "小哈"
        map[15937] = "小啰"
        map[16750] = "小算"
        map[13276] = "小法"
        map[10583] = "小鸭"
        print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
        PrintUtil.printHashMap(map: map)

        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        let name = map[15937]!
        print("\n학번 15937을 입력하여 조회한 이름 = \(name)")

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.removeValue(forKey: 10583)
        print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
        PrintUtil.printHashMap(map: map)

        /* 해시 테이블 순회 */
        print("\n키-값 쌍(키->값) 순회")
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
        print("\n키 Key만 순회")
        for key in map.keys {
            print(key)
        }
        print("\n값 Value만 순회")
        for value in map.values {
            print(value)
        }
    }
}
