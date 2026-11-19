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
        System.out.println("Хеш-значение целого числа " + num + " = " + hashNum);
        // Хеш-значение целого числа 3 = 3

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Хеш-значение булева значения " + bol + " = " + hashBol);
        // Хеш-значение булева значения true = 1231

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Хеш-значение десятичного числа " + dec + " = " + hashDec);
        // Хеш-значение десятичного числа 3.14159 = -1340954729

        String str = "Hello Algo";
        int hashStr = str.hashCode();
        System.out.println("Хеш-значение строки «" + str + "» = " + hashStr);
        // Хеш-значение строки «Hello Algo» = 387159329

        Object[] arr = { 12836, "Сяо Ха" };
        int hashArr = Arrays.hashCode(arr);
        System.out.println("Хеш-значение массива " + Arrays.toString(arr) + " = " + hashArr);
        // Хеш-значение массива [12836, Сяо Ха] = 1247701816

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("Хеш-значение объекта узла " + obj + " = " + hashObj);
        // Хеш-значение объекта узла utils.ListNode@7dc5e7b4 = 2110121908
        // [endregion]{builtin_hash}
    }
}
