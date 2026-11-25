/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 隨機存取元素 */
    static int randomAccess(int[] nums) {
        // 從區間 [0, nums.length) 隨機選取一個數
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 增加陣列長度 */
    static int[] extend(int[] nums, int enlarge) {
        // 初始化加長後的陣列
        int[] res = new int[nums.length + enlarge];
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }

    /* 在陣列的索引 index 處插入元素 num */
    static void insert(int[] nums, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }

    /* 刪除索引 index 處的元素 */
    static void remove(int[] nums, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 走訪陣列 */
    static void traverse(int[] nums) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        for (int num : nums) {
            count += num;
        }
    }

    /* 在陣列中尋找指定元素 */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 範例主程式 */
    public static void main(String[] args) {
        /* 初始化陣列 */
        int[] arr = new int[5];
        System.out.println("陣列 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("陣列 nums = " + Arrays.toString(nums));

        /* 隨機存取 */
        int randomNum = randomAccess(nums);
        System.out.println("從 nums 隨機取得的元素為 " + randomNum);

        /* 增加長度 */
        nums = extend(nums, 3);
        System.out.println("將陣列長度增加至 8，得到 nums = " + Arrays.toString(nums));

        /* 插入元素 */
        insert(nums, 6, 3);
        System.out.println("在索引 3 處插入數字 6，得到 nums = " + Arrays.toString(nums));

        /* 刪除元素 */
        remove(nums, 2);
        System.out.println("刪除索引 2 處的元素，得到 nums = " + Arrays.toString(nums));

        /* 走訪陣列 */
        traverse(nums);

        /* 尋找元素 */
        int index = find(nums, 3);
        System.out.println("在 nums 中尋找元素 3，得到索引 = " + index);
    }
}
