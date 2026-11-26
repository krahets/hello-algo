/**
* File: selection_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class selection_sort {
    /* 선택 정렬 */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 바깥 루프: 미정렬 구간은 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스 기록
            }
            // 최솟값과 미정렬 구간의 첫 원소 교환
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        SelectionSort(nums);
        Console.WriteLine("선택 정렬 후 nums = " + string.Join(" ", nums));
    }
}
