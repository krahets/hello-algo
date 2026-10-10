/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 要素へランダムアクセス */
    static int randomAccess(int[] nums) {
        // 区間 [0, nums.length) からランダムに 1 つの数を選ぶ
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // ランダムな要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 配列長を拡張する */
    static int[] extend(int[] nums, int enlarge) {
        // 拡張後の長さを持つ配列を初期化する
        int[] res = new int[nums.length + enlarge];
        // 元の配列の全要素を新しい配列にコピー
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }

    /* 配列の index 番目に要素 num を挿入 */
    static void insert(int[] nums, int num, int index) {
        // インデックス index 以降の全要素を 1 つ後ろへ移動する
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // index の要素に num を代入する
        nums[index] = num;
    }

    /* index の要素を削除する */
    static void remove(int[] nums, int index) {
        // インデックス index より後ろの全要素を 1 つ前へ移動する
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 配列を走査 */
    static void traverse(int[] nums) {
        int count = 0;
        // インデックスで配列を走査
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 配列要素を直接走査
        for (int num : nums) {
            count += num;
        }
    }

    /* 配列内で指定要素を探す */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* 配列を初期化 */
        int[] arr = new int[5];
        System.out.println("配列 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("配列 nums = " + Arrays.toString(nums));

        /* ランダムアクセス */
        int randomNum = randomAccess(nums);
        System.out.println("nums からランダムな要素を取得 " + randomNum);

        /* 長さを拡張 */
        nums = extend(nums, 3);
        System.out.println("配列の長さを 8 に拡張し、nums = " + Arrays.toString(nums));

        /* 要素を挿入する */
        insert(nums, 6, 3);
        System.out.println("インデックス 3 に数値 6 を挿入し、nums = " + Arrays.toString(nums));

        /* 要素を削除 */
        remove(nums, 2);
        System.out.println("インデックス 2 の要素を削除し、nums = " + Arrays.toString(nums));

        /* 配列を走査 */
        traverse(nums);

        /* 要素を探索する */
        int index = find(nums, 3);
        System.out.println("nums 内で要素 3 を検索し、インデックス = " + index);
    }
}
