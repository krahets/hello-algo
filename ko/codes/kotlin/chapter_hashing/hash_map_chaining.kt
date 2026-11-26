/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 체이닝 해시 테이블 */
class HashMapChaining {
    var size: Int // 키-값 쌍의 개수
    var capacity: Int // 해시 테이블의 용량
    val loadThres: Double // 용량을 늘리는 기준이 되는 적재율
    val extendRatio: Int // 용량 증가 배수
    var buckets: MutableList<MutableList<Pair>> // 버킷 배열

    /* 생성자 */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
    }

    /* 해시 함수 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 적재율 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* 조회 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // key를 찾지 못하면 null 반환
        return null
    }

    /* 추가 */
    fun put(key: Int, _val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 삭제 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    fun extend() {
        // 기존 해시 테이블 임시 보관
        val bucketsTmp = buckets
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio
        // mutablelist의 크기는 고정되어 있지 않음
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (bucket in bucketsTmp) {
            for (pair in bucket) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 해시 테이블 출력 */
    fun print() {
        for (bucket in buckets) {
            val res = mutableListOf<String>()
            for (pair in bucket) {
                val k = pair.key
                val v = pair._val
                res.add("$k -> $v")
            }
            println(res)
        }
    }
}

/* 실행 예제 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = HashMapChaining()

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
    val name = map.get(13276)
    println("\n학번 13276으로 조회한 이름: $name")

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(12836)
    println("\n키 12836 삭제 후 해시 테이블\nKey -> Value")
    map.print()
}