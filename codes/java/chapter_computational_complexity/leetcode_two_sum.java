/*
 * File: leetcode_two_sum.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

class solution_brute_force {
    public int[] twoSum(int[] nums, int target) {
        int size = nums.length;
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }
}

class solution_hash_map {
    public int[] twoSum(int[] nums, int target) {
        int size = nums.length;
        Map<Integer, Integer> dic = new HashMap<>();
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }
}

public class leetcode_two_sum {
    public static void main(String[] args) {
        // ======= Test Case =======
        int[] nums = { 2,7,11,15 };
        int target = 9;
        
        // ====== Driver Code ======
        // 方法一
        solution_brute_force slt1 = new solution_brute_force();
        int[] res = slt1.twoSum(nums, target);
        System.out.println(Arrays.toString(res));
        // 方法二
        solution_hash_map slt2 = new solution_hash_map();
        res = slt2.twoSum(nums, target);
        System.out.println(Arrays.toString(res));
    }
}
