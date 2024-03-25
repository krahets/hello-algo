/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* 隨機訪問元素 */
    static int randomAccess(int[] nums) {
        // 在區間 [0, nums.length) 中隨機抽取一個數字
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // 獲取並返回隨機元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 擴展陣列長度 */
    static int[] extend(int[] nums, int enlarge) {
        // 初始化一個擴展長度後的陣列
        int[] res = new int[nums.length + enlarge];
        // 將原陣列中的所有元素複製到新陣列
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // 返回擴展後的新陣列
        return res;
    }

    /* 在陣列的索引 index 處插入元素 num */
    static void insert(int[] nums, int num, int index) {
        // 把索引 index 以及之後的所有元素向後移動一位
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 賦給 index 處的元素
        nums[index] = num;
    }

    /* 刪除索引 index 處的元素 */
    static void remove(int[] nums, int index) {
        // 把索引 index 之後的所有元素向前移動一位
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 走訪陣列 */
    static void traverse(int[] nums) {
        int count = 0;
        // 透過索引走訪陣列
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列元素
        for (int num : nums) {
            count += num;
        }
    }

    /* 在陣列中查詢指定元素 */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* 初始化陣列 */
        int[] arr = new int[5];
        System.out.println("陣列 arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("陣列 nums = " + Arrays.toString(nums));

        /* 隨機訪問 */
        int randomNum = randomAccess(nums);
        System.out.println("在 nums 中獲取隨機元素 " + randomNum);

        /* 長度擴展 */
        nums = extend(nums, 3);
        System.out.println("將陣列長度擴展至 8 ，得到 nums = " + Arrays.toString(nums));

        /* 插入元素 */
        insert(nums, 6, 3);
        System.out.println("在索引 3 處插入數字 6 ，得到 nums = " + Arrays.toString(nums));

        /* 刪除元素 */
        remove(nums, 2);
        System.out.println("刪除索引 2 處的元素，得到 nums = " + Arrays.toString(nums));

        /* 走訪陣列 */
        traverse(nums);

        /* 查詢元素 */
        int index = find(nums, 3);
        System.out.println("在 nums 中查詢元素 3 ，得到索引 = " + index);
    }
}
