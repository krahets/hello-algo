/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 실행 코드 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = HashMap<Int, String>()

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    println("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    printHashMap(map)

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    val name = map[15937]
    println("\n학번 15937을 입력하여 조회한 이름 = $name")

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(10583)
    println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    printHashMap(map)

    /* 해시 테이블 순회 */
    println("\n키-값 쌍(키->값) 순회")
    for ((key, value) in map) {
        println("$key -> $value")
    }
    println("\n키 Key만 순회")
    for (key in map.keys) {
        println(key)
    }
    println("\n값 Value만 순회")
    for (_val in map.values) {
        println(_val)
    }
}