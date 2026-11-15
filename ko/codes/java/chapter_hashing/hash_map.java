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
        // [region]{init_hash_map}
        /* 해시 테이블 초기화 */
        Map<Integer, String> map = new HashMap<>();
        // [endregion]{init_hash_map}

        // [region]{add_pairs}
        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map.put(12836, "小哈");
        map.put(15937, "小啰");
        map.put(16750, "小算");
        map.put(13276, "小法");
        map.put(10583, "小鸭");
        // [endregion]{add_pairs}
        System.out.println("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        PrintUtil.printHashMap(map);

        // [region]{get_value}
        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        String name = map.get(15937);
        // [endregion]{get_value}
        System.out.println("\n학번 15937을 입력하여 조회한 이름 " + name);

        // [region]{remove_pair}
        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.remove(10583);
        // [endregion]{remove_pair}
        System.out.println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
        PrintUtil.printHashMap(map);

        System.out.println("\n키-값 쌍(키->값) 순회");
        // [region]{iterate_pairs}
        /* 해시 테이블 순회 */
        // 키-값 쌍 key->value를 순회한다
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        // [endregion]{iterate_pairs}

        System.out.println("\n키 Key만 순회");
        // [region]{iterate_keys}
        // 키 key만 순회한다
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        // [endregion]{iterate_keys}

        System.out.println("\n값 Value만 순회");
        // [region]{iterate_values}
        // 값 value만 순회한다
        for (String val : map.values()) {
            System.out.println(val);
        }
        // [endregion]{iterate_values}
    }
}
