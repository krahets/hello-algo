/**
 * File: hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

import utils.printHashMap

/* 실행 코드 */
fun main() {
    // [region]{init_hash_map}
    /* 해시 테이블 초기화 */
    val map = HashMap<Int, String>()
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"
    // [endregion]{add_pairs}
    println("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    printHashMap(map)

    // [region]{get_value}
    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    val name = map[15937]
    // [endregion]{get_value}
    println("\n학번 15937을 입력하여 조회한 이름 = $name")

    // [region]{remove_pair}
    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(10583)
    // [endregion]{remove_pair}
    println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    printHashMap(map)

    println("\n키-값 쌍(키->값) 순회")
    // [region]{iterate_pairs}
    /* 해시 테이블 순회 */
    // 키-값 쌍 key->value를 순회한다
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // [endregion]{iterate_pairs}

    println("\n키 Key만 순회")
    // [region]{iterate_keys}
    // 키 key만 순회한다
    for (key in map.keys) {
        println(key)
    }
    // [endregion]{iterate_keys}

    println("\n값 Value만 순회")
    // [region]{iterate_values}
    // 값 value만 순회한다
    for (_val in map.values) {
        println(_val)
    }
    // [endregion]{iterate_values}
}