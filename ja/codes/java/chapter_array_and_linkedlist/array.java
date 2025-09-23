/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 要素へのランダムアクセス */
    static int randomAccess(int[] nums) {
        // 区間 [0, nums.length) からランダムに数を選択
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // ランダム要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 配列長の拡張 */
    static int[] extend(int[] nums, int enlarge) {
        // 拡張された長さの配列を初期化
        int[] res = new int[nums.length + enlarge];
        // 元の配列のすべての要素を新しい配列にコピー
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }

    /* `index` に要素 num を挿入 */
    static void insert(int[] nums, int num, int index) {
        // `index` より後のすべての要素を1つ後ろに移動
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // index の要素に num を代入
        nums[index] = num;
    }

    /* `index` の要素を削除 */
    static void remove(int[] nums, int index) {
        // `index` より後のすべての要素を1つ前に移動
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 配列を走査 */
    static void traverse(int[] nums) {
        int count = 0;
        // インデックスによる配列の走査
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 配列要素の走査
        for (int num : nums) {
            count += num;
        }
    }

    /* 配列内で指定された要素を検索 */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* ドライバーコード */
    public static void main(String[] args) {
        /* 配列を初期化 */
        int[] arr = new int[5];
        System.out.println("配列 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("配列 nums = " + Arrays.toString(nums));

        /* ランダムアクセス */
        int randomNum = randomAccess(nums);
        System.out.println("nums からランダム要素を取得 = " + randomNum);

        /* 長さの拡張 */
        nums = extend(nums, 3);
        System.out.println("配列の長さを8に拡張し、nums = " + Arrays.toString(nums));

        /* 要素の挿入 */
        insert(nums, 6, 3);
        System.out.println("インデックス3に数値6を挿入し、nums = " + Arrays.toString(nums));

        /* 要素の削除 */
        remove(nums, 2);
        System.out.println("インデックス2の要素を削除し、nums = " + Arrays.toString(nums));

        /* 配列の走査 */
        traverse(nums);

        /* 要素の検索 */
        int index = find(nums, 3);
        System.out.println("nums で要素3を見つけ、インデックス = " + index);
    }
}