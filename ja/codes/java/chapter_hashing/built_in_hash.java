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
        System.out.println("整数 " + num + " のハッシュ値は " + hashNum);
        // 整数 3 のハッシュ値は 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("真偽値 " + bol + " のハッシュ値は " + hashBol);
        // 真偽値 true のハッシュ値は 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("小数 " + dec + " のハッシュ値は " + hashDec);
        // 小数 3.14159 のハッシュ値は -1340954729

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("文字列「" + str + "」のハッシュ値は " + hashStr);
        // 文字列「Hello 算法」のハッシュ値は -727081396

        Object[] arr = { 12836, "小哈" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("配列 " + Arrays.toString(arr) + " のハッシュ値は " + hashArr);
        // 配列 [12836, 小哈] のハッシュ値は 1151158

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("ノードオブジェクト " + obj + " のハッシュ値は " + hashObj);
        // ノードオブジェクト utils.ListNode@7dc5e7b4 のハッシュ値は 2110121908
        // [endregion]{builtin_hash}
    }
}
