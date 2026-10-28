/**
 * File: array_hash_map.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 키-값 쌍 */
class Pair(
    var key: Int,
    var _val: String
)

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    // 버킷 100개를 포함하는 배열을 초기화한다
    private val buckets = arrayOfNulls<Pair>(100)

    /* 해시 함수 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 조회 연산 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* 추가 연산 */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* 삭제 연산 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // null로 설정하여 삭제를 나타낸다
        buckets[index] = null
    }

    /* 모든 키-값 쌍 반환 */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* 모든 키 반환 */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* 모든 값 반환 */
    fun valueSet(): MutableList<String> {
        val valueSet = mutableListOf<String>()
        for (pair in buckets) {
            if (pair != null)
                valueSet.add(pair._val)
        }
        return valueSet
    }

    /* 해시 테이블 출력 */
    fun print() {
        for (kv in pairSet()) {
            val key = kv.key
            val _val = kv._val
            println("$key -> $_val")
        }
    }
}

/* 실행 코드 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = ArrayHashMap()

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.put(12836, "小哈")
    map.put(15937, "小啰")
    map.put(16750, "小算")
    map.put(13276, "小法")
    map.put(10583, "小鸭")
    println("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    map.print()

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    val name = map.get(15937)
    println("\n학번 15937을 입력하여 조회한 이름 = $name")

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(10583)
    println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    map.print()

    /* 해시 테이블 순회 */
    println("\n키-값 쌍(키 -> 값) 순회")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\n키 Key만 순회")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n값 Value만 순회")
    for (_val in map.valueSet()) {
        println(_val)
    }
}