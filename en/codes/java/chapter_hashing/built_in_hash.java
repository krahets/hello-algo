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
        System.out.println("Integer " + num + " has hash value " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Boolean " + bol + " has hash value " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Decimal " + dec + " has hash value " + hashDec);

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("String " + str + " has hash value " + hashStr);

        Object[] arr = { 12836, "小哈" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("Array " + Arrays.toString(arr) + " has hash value " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("Node object " + obj + " has hash value " + hashObj);
    }
}
