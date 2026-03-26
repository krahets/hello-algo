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
        System.out.println("Хеш-значение целого числа" + num + "равно" + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Хеш-значение логического значения" + bol + "равно" + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Хеш-значение десятичного числа" + dec + "равно" + hashDec);

        String str = "Hello Algo";
        int hashStr = str.hashCode();
        System.out.println("Хеш-значение строки" + str + "равно" + hashStr);

        Object[] arr = { 12836, "Сяо Ха" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("массив" + Arrays.toString(arr) + "равно" + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("объект узла" + obj + "равно" + hashObj);
    }
}
