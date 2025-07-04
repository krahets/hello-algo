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
        System.out.println("整数 " + num + " 的哈希值为 " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("布尔量 " + bol + " 的哈希值为 " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小数 " + dec + " 的哈希值为 " + hashDec);

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("字符串 " + str + " 的哈希值为 " + hashStr);

        Object[] arr = { 12836, "小哈" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("数组 " + Arrays.toString(arr) + " 的哈希值为 " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("节点对象 " + obj + " 的哈希值为 " + hashObj);
    }
}
