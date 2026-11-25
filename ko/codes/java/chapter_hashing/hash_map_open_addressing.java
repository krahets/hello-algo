/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    private int size; // 키-값 쌍의 개수
    private int capacity = 4; // 해시 테이블의 용량
    private final double loadThres = 2.0 / 3.0; // 용량을 늘리는 기준이 되는 적재율
    private final int extendRatio = 2; // 용량 증가 배수
    private Pair[] buckets; // 버킷 배열
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // 삭제 표시

    /* 생성자 */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* 해시 함수 */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* key에 해당하는 버킷 인덱스 찾기 */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while (buckets[index] != null) {
            // key를 만나면 해당 버킷 인덱스 반환
            if (buckets[index].key == key) {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index; // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % capacity;
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 */
    public String get(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 해당 val 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 키-값 쌍이 없으면 null 반환
        return null;
    }

    /* 추가 */
    public void put(int key, String val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend();
        }
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 키-값 쌍이 없으면 새로 추가
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 */
    public void remove(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 늘리기 */
    private void extend() {
        // 기존 해시 테이블 임시 보관
        Pair[] bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // 해시 테이블 초기화
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // 추가
        // 해시 테이블에 키-값 쌍 (key, val) 추가
        hashmap.put(12836, "샤오하");
        hashmap.put(15937, "샤오뤄");
        hashmap.put(16750, "샤오쑤안");
        hashmap.put(13276, "샤오파");
        hashmap.put(10583, "샤오야");
        System.out.println("\n추가 후 해시 테이블\nKey -> Value");
        hashmap.print();

        // 조회
        // 해시 테이블에 키 key를 입력하여 값 val 조회
        String name = hashmap.get(13276);
        System.out.println("\n학번 13276으로 조회한 이름: " + name);

        // 삭제
        // 해시 테이블에서 키-값 쌍 (key, val) 삭제
        hashmap.remove(16750);
        System.out.println("\n키 16750 삭제 후 해시 테이블\nKey -> Value");
        hashmap.print();
    }
}
