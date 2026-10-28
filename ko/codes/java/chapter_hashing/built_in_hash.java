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
        int num = 3;
        int hashNum = Integer.hashCode(num);
        System.out.println("정수 " + num + " ; 해시값: " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("불리언 값 " + bol + " ; 해시값: " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("소수 " + dec + " ; 해시값: " + hashDec);

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("문자열 " + str + " ; 해시값: " + hashStr);

        Object[] arr = { 12836, "小哈" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("배열 " + Arrays.toString(arr) + " ; 해시값: " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("노드 객체 " + obj + " ; 해시값: " + hashObj);
    }
}
