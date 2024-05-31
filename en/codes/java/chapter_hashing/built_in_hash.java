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
        System.out.println("The hash value of integer " + num + " is " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("The hash value of boolean " + bol + " is " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("The hash value of decimal " + dec + " is " + hashDec);

        String str = "Hello algorithm";
        int hashStr = str.hashCode();
        System.out.println("The hash value of string " + str + " is " + hashStr);

        Object[] arr = { 12836, "Ha" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("The hash value of array " + Arrays.toString(arr) + " is " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("The hash value of node object " + obj + " is " + hashObj);
    }
}
