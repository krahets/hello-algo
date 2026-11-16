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
        System.out.println("整数 " + num + " 的哈希值为 " + hashNum);
        // 整数 3 的哈希值为 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("布尔量 " + bol + " 的哈希值为 " + hashBol);
        // 布尔量 true 的哈希值为 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小数 " + dec + " 的哈希值为 " + hashDec);
        // 小数 3.14159 的哈希值为 -1340954729

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("字符串“" + str + "”的哈希值为 " + hashStr);
        // 字符串“Hello 算法”的哈希值为 -727081396

        Object[] arr = { 12836, "小哈" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("数组 " + Arrays.toString(arr) + " 的哈希值为 " + hashArr);
        // 数组 [12836, 小哈] 的哈希值为 1151158

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("节点对象 " + obj + " 的哈希值为 " + hashObj);
        // 节点对象 utils.ListNode@7dc5e7b4 的哈希值为 2110121908
        // [endregion]{builtin_hash}
    }
}
