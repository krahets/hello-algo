/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 要素にランダムアクセスする */
    static int randomAccess(int[] nums) {
        // 区間 [0, nums.length) から数値をランダムに 1 つ選ぶ
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // ランダムに選んだ要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 配列の長さを拡張する */
    static int[] extend(int[] nums, int enlarge) {
        // 拡張後の長さの配列を初期化する
        int[] res = new int[nums.length + enlarge];
        // 元の配列の全要素を新しい配列にコピーする
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }

    /* 配列のインデックス index に要素 num を挿入する */
    static void insert(int[] nums, int num, int index) {
        // インデックス index 以降の全要素を 1 つ後ろにずらす
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // インデックス index の要素に num を代入する
        nums[index] = num;
    }

    /* インデックス index の要素を削除する */
    static void remove(int[] nums, int index) {
        // インデックス index より後の全要素を 1 つ前にずらす
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 配列を走査する */
    static void traverse(int[] nums) {
        int count = 0;
        // インデックスを使って配列を走査する
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 配列の要素を直接走査する
        for (int num : nums) {
            count += num;
        }
    }

    /* 配列から指定した要素を探索する */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 実行用コード */
    public static void main(String[] args) {
        /* 配列を初期化する */
        int[] arr = new int[5];
        System.out.println("配列 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("配列 nums = " + Arrays.toString(nums));

        /* ランダムアクセス */
        int randomNum = randomAccess(nums);
        System.out.println("nums からランダムに取得した要素 " + randomNum);

        /* 長さの拡張 */
        nums = extend(nums, 3);
        System.out.println("配列の長さを 8 に拡張した結果 nums = " + Arrays.toString(nums));

        /* 要素を挿入する */
        insert(nums, 6, 3);
        System.out.println("インデックス 3 に数値 6 を挿入した結果 nums = " + Arrays.toString(nums));

        /* 要素を削除する */
        remove(nums, 2);
        System.out.println("インデックス 2 の要素を削除した結果 nums = " + Arrays.toString(nums));

        /* 配列を走査する */
        traverse(nums);

        /* 要素を探索する */
        int index = find(nums, 3);
        System.out.println("nums から要素 3 を探索した結果のインデックス = " + index);
    }
}
