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
    // 버킷 100개로 배열 초기화
    private val buckets = arrayOfNulls<Pair>(100)

    /* 해시 함수 */
    fun hashFunc(key: Int): Int {
        val index = key % 100
        return index
    }

    /* 조회 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val pair = buckets[index] ?: return null
        return pair._val
    }

    /* 추가 */
    fun put(key: Int, _val: String) {
        val pair = Pair(key, _val)
        val index = hashFunc(key)
        buckets[index] = pair
    }

    /* 삭제 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        // null로 설정하여 삭제를 나타냄
        buckets[index] = null
    }

    /* 모든 키-값 쌍 가져오기 */
    fun pairSet(): MutableList<Pair> {
        val pairSet = mutableListOf<Pair>()
        for (pair in buckets) {
            if (pair != null)
                pairSet.add(pair)
        }
        return pairSet
    }

    /* 모든 키 가져오기 */
    fun keySet(): MutableList<Int> {
        val keySet = mutableListOf<Int>()
        for (pair in buckets) {
            if (pair != null)
                keySet.add(pair.key)
        }
        return keySet
    }

    /* 모든 값 가져오기 */
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

/* 실행 예제 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = ArrayHashMap()

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.put(12836, "샤오하")
    map.put(15937, "샤오뤄")
    map.put(16750, "샤오쑤안")
    map.put(13276, "샤오파")
    map.put(10583, "샤오야")
    println("\n추가 후 해시 테이블\nKey -> Value")
    map.print()

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    val name = map.get(15937)
    println("\n학번 15937로 조회한 이름: $name")

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583)
    println("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
    map.print()

    /* 해시 테이블 순회 */
    println("\n키-값 쌍 순회 Key -> Value")
    for (kv in map.pairSet()) {
        println("${kv.key} -> ${kv._val}")
    }
    println("\n키만 순회 Key")
    for (key in map.keySet()) {
        println(key)
    }
    println("\n값만 순회 Value")
    for (_val in map.valueSet()) {
        println(_val)
    }
}