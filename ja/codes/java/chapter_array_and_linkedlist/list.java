/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* リストを初期化 */
        // 配列の要素型は `int[]` のラッパークラスである `Integer[]` である点に注意
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("リスト nums = " + nums);

        /* 要素にアクセス */
        int num = nums.get(1);
        System.out.println("インデックス 1 の要素にアクセスし、num = " + num);

        /* 要素を更新 */
        nums.set(1, 0);
        System.out.println("インデックス 1 の要素を 0 に更新し、nums = " + nums);

        /* リストを空にする */
        nums.clear();
        System.out.println("リストを空にした後 nums = " + nums);

        /* 末尾に要素を追加 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("要素追加後 nums = " + nums);

        /* 中間に要素を挿入 */
        nums.add(3, 6);
        System.out.println("インデックス 3 に数値 6 を挿入し、nums = " + nums);

        /* 要素を削除 */
        nums.remove(3);
        System.out.println("インデックス 3 の要素を削除し、nums = " + nums);

        /* インデックスでリストを走査 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* リスト要素を直接走査 */
        for (int x : nums) {
            count += x;
        }

        /* 2 つのリストを連結する */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("リスト nums1 を nums の後ろに連結し、nums = " + nums);

        /* リストをソート */
        Collections.sort(nums);
        System.out.println("リストをソートした後 nums = " + nums);
    }
}
