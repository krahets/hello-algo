/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* 키-값 쌍 */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // 버킷 100개로 배열 초기화
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* 해시 함수 */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 조회 */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* 추가 */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* 삭제 */
    public void remove(int key) {
        int index = hashFunc(key);
        // null로 설정하여 삭제를 나타냄
        buckets.set(index, null);
    }

    /* 모든 키-값 쌍 가져오기 */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* 모든 키 가져오기 */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* 모든 값 가져오기 */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* 해시 테이블 출력 */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* 해시 테이블 초기화 */
        ArrayHashMap map = new ArrayHashMap();

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
        String name = map.get(15937);
        System.out.println("\n학번 15937로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.remove(10583);
        System.out.println("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
        map.print();

        /* 해시 테이블 순회 */
        System.out.println("\n키-값 쌍 순회 Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\n키만 순회 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n값만 순회 Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
