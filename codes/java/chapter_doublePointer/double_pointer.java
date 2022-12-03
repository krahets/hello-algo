
import java.util.Arrays;

public class double_pointer {
    public static void main(String[] args) {
        //int[] arr = {3,2,2,3};
        //int res = removeElement(arr, 3);
        //System.out.println("移除元素后的有效长度"+res+" :"+" 移除过后数组内的数据"+ Arrays.toString(arr));

        int[] arr = {2,7,11,15};
        int[] result = twoSum(arr, 9);
        System.out.println("结果集:"+ Arrays.toString(result));
    }

    //快慢指针案例
    static int removeElement(int[] nums, int val) {
        int fast = 0, slow = 0;
        while (fast < nums.length) {
            //如果等于target那么fast++，slow记录命中的下表等到fast找到不等于的时候替换slow
            if (nums[fast] != val) {
                nums[slow] = nums[fast];
                slow++;
            }
            fast++;
        }
        return slow;
    }
    //相向左右指针案例
    static int[] twoSum(int[] nums, int target) {
        // 一左一右两个指针相向而行
        int left = 0, right = nums.length - 1;
        while (left < right) {
            int sum = nums[left] + nums[right];
            if (sum == target) {
                return new int[]{left, right};
            } else if (sum < target) {
                left++; // 让 sum 大一点
            } else if (sum > target) {
                right--; // 让 sum 小一点
            }
        }
        return new int[]{-1, -1};
    }
}
