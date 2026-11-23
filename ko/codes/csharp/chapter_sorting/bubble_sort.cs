/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* 버블 정렬 */
    void BubbleSort(int[] nums) {
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
        for (int i = nums.Length - 1; i > 0; i--) {
            // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j]와 nums[j + 1]을 교환한다
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* 버블 정렬(플래그 최적화)*/
    void BubbleSortWithFlag(int[] nums) {
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // 플래그를 초기화한다
            // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j]와 nums[j + 1]을 교환한다
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 원소가 교환되었음을 기록한다
                }
            }
            if (!flag) break;     // 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("버블 정렬을 마친 후  nums = " + string.Join(",", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("버블 정렬을 마친 후 nums1 = " + string.Join(",", nums1));
    }
}
