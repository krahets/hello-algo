/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    private int size; // 키-값 쌍 개수
    private int capacity = 4; // 해시 테이블 용량
    private final double loadThres = 2.0 / 3.0; // 용량 확장을 수행하는 적재율 임계값
    private final int extendRatio = 2; // 용량 확장 배수
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

    /* key에 해당하는 버킷 인덱스 탐색 */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while (buckets[index] != null) {
            // key를 만나면 해당 버킷 인덱스를 반환한다
            if (buckets[index].key == key) {
                // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
                }
                return index; // 버킷 인덱스를 반환한다
            }
            // 처음 만난 삭제 표시를 기록한다
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % capacity;
        }
        // key가 없으면 추가할 위치의 인덱스를 반환한다
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 연산 */
    public String get(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 해당 val을 반환한다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 키-값 쌍이 없으면 null을 반환한다
        return null;
    }

    /* 추가 연산 */
    public void put(int key, String val) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (loadFactor() > loadThres) {
            extend();
        }
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 연산 */
    public void remove(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 확장 */
    private void extend() {
        // 원래 해시 테이블을 임시로 저장한다
        Pair[] bucketsTmp = buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

        // 추가 연산
        // 해시 테이블에 키-값 쌍 (key, val)을 추가한다
        hashmap.put(12836, "小哈");
        hashmap.put(15937, "小啰");
        hashmap.put(16750, "小算");
        hashmap.put(13276, "小法");
        hashmap.put(10583, "小鸭");
        System.out.println("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        hashmap.print();

        // 조회 연산
        // 해시 테이블에 키 key를 입력하여 값 val을 얻는다
        String name = hashmap.get(13276);
        System.out.println("\n학번 13276을 입력하여 조회한 이름 " + name);

        // 삭제 연산
        // 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
        hashmap.remove(16750);
        System.out.println("\n16750을 삭제한 후의 해시 테이블\n키 -> 값");
        hashmap.print();
    }
}
