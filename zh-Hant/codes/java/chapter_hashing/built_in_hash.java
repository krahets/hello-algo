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
        System.out.println("整數 " + num + " 的雜湊值為 " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("布林量 " + bol + " 的雜湊值為 " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小數 " + dec + " 的雜湊值為 " + hashDec);

        String str = "Hello 演算法";
        int hashStr = str.hashCode();
        System.out.println("字串 " + str + " 的雜湊值為 " + hashStr);

        Object[] arr = { 12836, "小哈" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("陣列 " + Arrays.toString(arr) + " 的雜湊值為 " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("節點物件 " + obj + " 的雜湊值為 " + hashObj);
    }
}
