/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

/* 체이닝 해시 테이블 */
class HashMapChaining {
    int size; // 키-값 쌍의 개수
    int capacity; // 해시 테이블의 용량
    double loadThres; // 용량을 늘리는 기준이 되는 적재율
    int extendRatio; // 용량 증가 배수
    List<List<Pair>> buckets; // 버킷 배열

    /* 생성자 */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* 해시 함수 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* 조회 */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key를 찾지 못하면 null 반환
        return null;
    }

    /* 추가 */
    void put(int key, String val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* 삭제 */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    void extend() {
        // 기존 해시 테이블 임시 보관
        List<List<Pair>> bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* 해시 테이블 초기화 */
        HashMapChaining map = new HashMapChaining();

        /* 추가 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        map.put(12836, "샤오하");
        map.put(15937, "샤오뤄");
        map.put(16750, "샤오쑤안");
        map.put(13276, "샤오파");
        map.put(10583, "샤오야");
        System.out.println("\n추가 후 해시 테이블\nKey -> Value");
        map.print();

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        String name = map.get(13276);
        System.out.println("\n학번 13276으로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.remove(12836);
        System.out.println("\n키 12836 삭제 후 해시 테이블\nKey -> Value");
        map.print();
    }
}
