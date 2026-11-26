/**
 * File: hash_map_open_addressing.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_hashing

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    private var size: Int               // 키-값 쌍의 개수
    private var capacity: Int           // 해시 테이블의 용량
    private val loadThres: Double       // 용량을 늘리는 기준이 되는 적재율
    private val extendRatio: Int        // 용량 증가 배수
    private var buckets: Array<Pair?>   // 버킷 배열
    private val TOMBSTONE: Pair         // 삭제 표시

    /* 생성자 */
    init {
        size = 0
        capacity = 4
        loadThres = 2.0 / 3.0
        extendRatio = 2
        buckets = arrayOfNulls(capacity)
        TOMBSTONE = Pair(-1, "-1")
    }

    /* 해시 함수 */
    fun hashFunc(key: Int): Int {
        return key % capacity
    }

    /* 적재율 */
    fun loadFactor(): Double {
        return (size / capacity).toDouble()
    }

    /* key에 해당하는 버킷 인덱스 찾기 */
    fun findBucket(key: Int): Int {
        var index = hashFunc(key)
        var firstTombstone = -1
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while (buckets[index] != null) {
            // key를 만나면 해당 버킷 인덱스 반환
            if (buckets[index]?.key == key) {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index]
                    buckets[index] = TOMBSTONE
                    return firstTombstone // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % capacity
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return if (firstTombstone == -1) index else firstTombstone
    }

    /* 조회 */
    fun get(key: Int): String? {
        // key에 해당하는 버킷 인덱스 찾기
        val index = findBucket(key)
        // 키-값 쌍을 찾으면 해당 val 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index]?._val
        }
        // 키-값 쌍이 없으면 null 반환
        return null
    }

    /* 추가 */
    fun put(key: Int, _val: String) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend()
        }
        // key에 해당하는 버킷 인덱스 찾기
        val index = findBucket(key)
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index]!!._val = _val
            return
        }
        // 키-값 쌍이 없으면 새로 추가
        buckets[index] = Pair(key, _val)
        size++
    }

    /* 삭제 */
    fun remove(key: Int) {
        // key에 해당하는 버킷 인덱스 찾기
        val index = findBucket(key)
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE
            size--
        }
    }

    /* 해시 테이블 용량 늘리기 */
    fun extend() {
        // 기존 해시 테이블 임시 보관
        val bucketsTmp = buckets
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio
        buckets = arrayOfNulls(capacity)
        size = 0
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair._val)
            }
        }
    }

    /* 해시 테이블 출력 */
    fun print() {
        for (pair in buckets) {
            if (pair == null) {
                println("null")
            } else if (pair == TOMBSTONE) {
                println("TOMESTOME")
            } else {
                println("${pair.key} -> ${pair._val}")
            }
        }
    }
}

/* 실행 예제 */
fun main() {
    // 해시 테이블 초기화
    val hashmap = HashMapOpenAddressing()

    // 추가
    // 해시 테이블에 키-값 쌍 (key, val) 추가
    hashmap.put(12836, "샤오하")
    hashmap.put(15937, "샤오뤄")
    hashmap.put(16750, "샤오쑤안")
    hashmap.put(13276, "샤오파")
    hashmap.put(10583, "샤오야")
    println("\n추가 후 해시 테이블\nKey -> Value")
    hashmap.print()

    // 조회
    // 해시 테이블에 키 key를 입력하여 값 val 조회
    val name = hashmap.get(13276)
    println("\n학번 13276으로 조회한 이름: $name")

    // 삭제
    // 해시 테이블에서 키-값 쌍 (key, val) 삭제
    hashmap.remove(16750)
    println("\n키 16750 삭제 후 해시 테이블\nKey -> Value")
    hashmap.print()
}