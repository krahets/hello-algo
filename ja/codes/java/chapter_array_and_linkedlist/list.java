/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* リストを初期化する */
        // 配列の要素型には int[] のラッパークラス Integer[] を使うことに注意
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("リスト nums = " + nums);

        // [region]{access_element}
        /* 要素にアクセスする */
        int num = nums.get(1); // インデックス 1 の要素にアクセスする
        // [endregion]{access_element}
        System.out.println("インデックス 1 の要素にアクセスした結果 num = " + num);

        // [region]{update_element}
        /* 要素を更新する */
        nums.set(1, 0); // インデックス 1 の要素を 0 に更新する
        // [endregion]{update_element}
        System.out.println("インデックス 1 の要素を 0 に更新した結果 nums = " + nums);

        // [region]{clear_list}
        /* リストを空にする */
        nums.clear();
        // [endregion]{clear_list}
        System.out.println("リストを空にした後 nums = " + nums);

        // [region]{append_element}
        /* 末尾に要素を追加する */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        // [endregion]{append_element}
        System.out.println("要素を追加した後 nums = " + nums);

        // [region]{insert_element}
        /* 途中に要素を挿入する */
        nums.add(3, 6); // インデックス 3 に数値 6 を挿入する
        // [endregion]{insert_element}
        System.out.println("インデックス 3 に数値 6 を挿入した結果 nums = " + nums);

        // [region]{remove_element}
        /* 要素を削除する */
        nums.remove(3); // インデックス 3 の要素を削除する
        // [endregion]{remove_element}
        System.out.println("インデックス 3 の要素を削除した結果 nums = " + nums);

        // [region]{iterate_list}
        /* インデックスを使ってリストを走査する */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }

        /* リストの要素を直接走査する */
        for (int x : nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 2 つのリストを連結する */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1); // リスト nums の後ろに nums1 を連結する
        // [endregion]{concat_list}
        System.out.println("リスト nums の後ろに nums1 を連結した結果 nums = " + nums);

        // [region]{sort_list}
        /* リストをソートする */
        Collections.sort(nums); // ソート後、リストの要素は昇順に並ぶ
        // [endregion]{sort_list}
        System.out.println("リストをソートした後 nums = " + nums);
    }
}
