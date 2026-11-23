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
        // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
        for (int i = 0; i < n - 1; i++) {
            // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 최솟값의 인덱스를 기록한다
            }
            // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        SelectionSort(nums);
        Console.WriteLine("선택 정렬을 마친 후 nums = " + string.Join(" ", nums));
    }
}
