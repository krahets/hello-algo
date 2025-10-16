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
        System.out.println("整数 " + num + " のハッシュ値は " + hashNum + " です");

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("ブール値 " + bol + " のハッシュ値は " + hashBol + " です");

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小数 " + dec + " のハッシュ値は " + hashDec + " です");

        String str = "Hello algorithm";
        int hashStr = str.hashCode();
        System.out.println("文字列 " + str + " のハッシュ値は " + hashStr + " です");

        Object[] arr = { 12836, "Ha" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("配列 " + Arrays.toString(arr) + " のハッシュ値は " + hashTup + " です");

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj + " です");
    }
}