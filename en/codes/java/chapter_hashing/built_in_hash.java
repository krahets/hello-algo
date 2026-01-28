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
        System.out.println("Hash value of integer " + num + " is " + hashNum);

        boolean bol = true;
        int hashBol = Boolean.hashCode(bol);
        System.out.println("Hash value of boolean " + bol + " is " + hashBol);

        double dec = 3.14159;
        int hashDec = Double.hashCode(dec);
        System.out.println("Hash value of decimal " + dec + " is " + hashDec);

        String str = "Hello Algo";
        int hashStr = str.hashCode();
        System.out.println("Hash value of string " + str + " is " + hashStr);

        Object[] arr = { 12836, "Xiao Ha" };
        int hashTup = Arrays.hashCode(arr);
        System.out.println("Hash value of array " + Arrays.toString(arr) + " is " + hashTup);

        ListNode obj = new ListNode(0);
        int hashObj = obj.hashCode();
        System.out.println("Hash value of node object " + obj + " is " + hashObj);
    }
}
