/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* リストの初期化 */
        // 配列の要素型は Integer[]、int のラッパークラス
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("リスト nums = " + nums);

        /* 要素へのアクセス */
        int num = nums.get(1);
        System.out.println("インデックス1の要素にアクセス、取得した num = " + num);

        /* 要素の更新 */
        nums.set(1, 0);
        System.out.println("インデックス1の要素を0に更新し、nums = " + nums);

        /* リストのクリア */
        nums.clear();
        System.out.println("リストをクリアした後、nums = " + nums);

        /* 末尾に要素を追加 */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("要素を追加した後、nums = " + nums);

        /* 中間に要素を挿入 */
        nums.add(3, 6);
        System.out.println("インデックス3に数値6を挿入し、nums = " + nums);

        /* 要素の削除 */
        nums.remove(3);
        System.out.println("インデックス3の要素を削除し、nums = " + nums);

        /* インデックスによるリストの走査 */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* リスト要素の走査 */
        for (int x : nums) {
            count += x;
        }

        /* 2つのリストの連結 */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("リスト nums1 を nums に連結し、nums = " + nums);

        /* リストのソート */
        Collections.sort(nums);
        System.out.println("リストをソートした後、nums = " + nums);
    }
}