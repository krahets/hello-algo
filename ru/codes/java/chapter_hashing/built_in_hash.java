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
        System.out.println("Целое число " + num + " имеет хеш " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Логическое значение " + bol + " имеет хеш " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Вещественное число " + dec + " имеет хеш " + hashDec);

        String str = "Hello 算法";
        int hashStr = str.hashCode();
        System.out.println("Строка " + str + " имеет хеш " + hashStr);

        Object[] arr = { 12836, "小哈" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("Массив " + Arrays.toString(arr) + " имеет хеш " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("Объект узла " + obj + " имеет хеш " + hashObj);
    }
}
