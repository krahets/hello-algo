/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 실행 예제 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = HashMap<Int, String>()

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "샤오하"
    map[15937] = "샤오뤄"
    map[16750] = "샤오쑤안"
    map[13276] = "샤오파"
    map[10583] = "샤오야"
    println("\n추가 후 해시 테이블\nKey -> Value")
    printHashMap(map)

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    val name = map[15937]
    println("\n학번 15937로 조회한 이름: $name")

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583)
    println("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
    printHashMap(map)

    /* 해시 테이블 순회 */
    println("\n키-값 쌍 순회 Key->Value")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\n키만 순회 Key")
    for (key in map.keys) {
        println(key)
    }
    println("\n값만 순회 Value")
    for (_val in map.values) {
        println(_val)
    }
}