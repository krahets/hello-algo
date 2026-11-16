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
        System.out.println("Integer " + num + " has hash value " + hashNum);
        // Integer 3 has hash value 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Boolean " + bol + " has hash value " + hashBol);
        // Boolean true has hash value 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Floating-point number " + dec + " has hash value " + hashDec);
        // Floating-point number 3.14159 has hash value -1340954729

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("String '" + str + "' has hash value " + hashStr);
        // String 'Hello 算法' has hash value -727081396

        Object[] arr = { 12836, "小哈" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("Array " + Arrays.toString(arr) + " has hash value " + hashArr);
        // Array [12836, 小哈] has hash value 1151158

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("Node object " + obj + " has hash value " + hashObj);
        // Node object utils.ListNode@7dc5e7b4 has hash value 2110121908
        // [endregion]{builtin_hash}
    }
}
