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

        /* 추가 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        map.put(12836, "샤오하");
        map.put(15937, "샤오뤄");
        map.put(16750, "샤오쑤안");
        map.put(13276, "샤오파");
        map.put(10583, "샤오야");
        System.out.println("\n추가 후 해시 테이블\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        String name = map.get(15937);
        System.out.println("\n학번 15937로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.remove(10583);
        System.out.println("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* 해시 테이블 순회 */
        System.out.println("\n키-값 쌍 순회 Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\n키만 순회 Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\n값만 순회 Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
