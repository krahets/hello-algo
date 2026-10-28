/**
 * File: hash_map_chaining.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 체이닝 해시 테이블 */
class HashMapChaining {
    var size: Int // 키-값 쌍 개수
    var capacity: Int // 해시 테이블 용량
    val loadThres: Double // 용량 확장을 수행하는 적재율 임계값
    val extendRatio: Int // 용량 확장 배수
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

    /* 조회 연산 */
    fun get(key: Int): String? {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for (pair in bucket) {
            if (pair.key == key) return pair._val
        }
        // key를 찾지 못하면 null을 반환한다
        return null
    }

    /* 추가 연산 */
    fun put(key: Int, _val: String) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (loadFactor() > loadThres) {
            extend()
        }
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for (pair in bucket) {
            if (pair.key == key) {
                pair._val = _val
                return
            }
        }
        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        val pair = Pair(key, _val)
        bucket.add(pair)
        size++
    }

    /* 삭제 연산 */
    fun remove(key: Int) {
        val index = hashFunc(key)
        val bucket = buckets[index]
        // 버킷을 순회하며 키-값 쌍을 삭제한다
        for (pair in bucket) {
            if (pair.key == key) {
                bucket.remove(pair)
                size--
                break
            }
        }
    }

    /* 해시 테이블 용량 확장 */
    fun extend() {
        // 원래 해시 테이블을 임시로 저장한다
        val bucketsTmp = buckets
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio
        // mutablelist는 크기가 고정되어 있지 않다
        buckets = mutableListOf()
        for (i in 0..<capacity) {
            buckets.add(mutableListOf())
        }
        size = 0
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

/* 실행 코드 */
fun main() {
    /* 해시 테이블 초기화 */
    val map = HashMapChaining()

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
    val name = map.get(13276)
    println("\n학번 13276을 입력하여 조회한 이름 = $name")

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(12836)
    println("\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값")
    map.print()
}