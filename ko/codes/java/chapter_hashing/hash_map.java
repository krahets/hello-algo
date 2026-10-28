/**
 * File: hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;
import utils.*;

public class hash_map {
    public static void main(String[] args) {
        /* 해시 테이블 초기화 */
        Map<Integer, String> map = new HashMap<>();

        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        System.out.println("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        PrintUtil.printHashMap(map);

        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        String name = map.get(15937);
        System.out.println("\n학번 15937을 입력하여 조회한 이름 " + name);

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.remove(10583);
        System.out.println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
        PrintUtil.printHashMap(map);

        /* 해시 테이블 순회 */
        System.out.println("\n키-값 쌍(키->값) 순회");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\n키 Key만 순회");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n값 Value만 순회");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
