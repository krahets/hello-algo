
import java.util.Arrays;

public class double_pointer {
    public static void main(String[] args) {
        int[] arr = {2,7,11,15};
        int[] result = twoSum(arr, 9);
        System.out.println("结果集:"+ Arrays.toString(result));
    }

    /*  快慢指针案例 */
    static int removeElement(int[] nums, int val) {
        int fast = 0, slow = 0;
        while (fast < nums.length) {
            /*
             * 如果nums[fast] = target 那么fast++，
             * 如果nums[fast] != target nums[slow]与nums[fast]交换
             */
            if (nums[fast] != val) {
                nums[slow] = nums[fast];
                slow++;
            }
            fast++;
        }
        return slow;
    }
    /*  相向左右指针案例  */
    static int[] twoSum(int[] nums, int target) {
        // 一左一右两个指针相向而行
        int left = 0, right = nums.length - 1;
        while (left < right) {
            int sum = nums[left] + nums[right];
            if (sum == target) {
	// 题目要求下表从1开始
                return new int[]{left + 1, right + 1};
            } else if (sum < target) {
                left++; // 让 sum 大一点
            } else if (sum > target) {
                right--; // 让 sum 小一点
            }
        }
        return new int[]{-1, -1};
    }
}
