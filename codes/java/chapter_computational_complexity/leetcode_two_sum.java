/*
 * File: leetcode_two_sum.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

class SolutionBruteForce {
    public int[] twoSum(int[] nums, int target) {
        int size = nums.length;
        // 两层循环，时间复杂度 O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }
}

class SolutionHashMap {
    public int[] twoSum(int[] nums, int target) {
        int size = nums.length;
        // 辅助哈希表，空间复杂度 O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 单层循环，时间复杂度 O(n)
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
        SolutionBruteForce slt1 = new SolutionBruteForce();
        int[] res = slt1.twoSum(nums, target);
        System.out.println("方法一 res = " + Arrays.toString(res));
        // 方法二
        SolutionHashMap slt2 = new SolutionHashMap();
        res = slt2.twoSum(nums, target);
        System.out.println("方法二 res = " + Arrays.toString(res));
    }
}
