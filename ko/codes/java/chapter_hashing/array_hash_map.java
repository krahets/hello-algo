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
        // 버킷 100개를 포함하는 배열을 초기화한다
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

    /* 조회 연산 */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* 추가 연산 */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* 삭제 연산 */
    public void remove(int key) {
        int index = hashFunc(key);
        // null로 설정하여 삭제를 나타낸다
        buckets.set(index, null);
    }

    /* 모든 키-값 쌍 반환 */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* 모든 키 반환 */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* 모든 값 반환 */
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

        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        map.print();

        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        String name = map.get(15937);
        System.out.println("\n학번 15937을 입력하여 조회한 이름 " + name);

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.remove(10583);
        System.out.println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
        map.print();

        /* 해시 테이블 순회 */
        System.out.println("\n키-값 쌍(키->값) 순회");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\n키 Key만 순회");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n값 Value만 순회");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
