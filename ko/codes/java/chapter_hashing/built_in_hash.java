/**
 * File: built_in_hash.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import utils.*;
import java.util.*;

public class built_in_hash {
    public static void main(String[] args) {
        // [region]{builtin_hash}
        int num = 3;
        int hashNum = Integer.hashCode(num);
        System.out.println("정수 " + num + " → 해시값: " + hashNum);
        // 정수 3 → 해시값: 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("불리언 값 " + bol + " → 해시값: " + hashBol);
        // 불리언 값 true → 해시값: 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("소수 " + dec + " → 해시값: " + hashDec);
        // 소수 3.14159 → 해시값: -1340954729

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("문자열 ‘" + str + "’ → 해시값: " + hashStr);
        // 문자열 ‘Hello 算法’ → 해시값: -727081396

        Object[] arr = { 12836, "小哈" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("배열 " + Arrays.toString(arr) + " → 해시값: " + hashArr);
        // 배열 [12836, 小哈] → 해시값: 1151158

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("노드 객체 " + obj + " → 해시값: " + hashObj);
        // 노드 객체 utils.ListNode@7dc5e7b4 → 해시값: 2110121908
        // [endregion]{builtin_hash}
    }
}
