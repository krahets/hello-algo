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
        System.out.println("整數 " + num + " 的雜湊值為 " + hashNum);
        // 整數 3 的雜湊值為 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("布林量 " + bol + " 的雜湊值為 " + hashBol);
        // 布林量 true 的雜湊值為 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小數 " + dec + " 的雜湊值為 " + hashDec);
        // 小數 3.14159 的雜湊值為 -1340954729

        String str = "Hello 演算法";
        int hashStr = str.hashCode();
        System.out.println("字串“" + str + "”的雜湊值為 " + hashStr);
        // 字串“Hello 演算法”的雜湊值為 -727081396

        Object[] arr = { 12836, "小哈" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("陣列 " + Arrays.toString(arr) + " 的雜湊值為 " + hashArr);
        // 陣列 [12836, 小哈] 的雜湊值為 1151158

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("節點物件 " + obj + " 的雜湊值為 " + hashObj);
        // 節點物件 utils.ListNode@7dc5e7b4 的雜湊值為 2110121908
        // [endregion]{builtin_hash}
    }
}
