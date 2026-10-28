/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class insertion_sort {
    /* 삽입 정렬 */
    void InsertionSort(int[] nums) {
        // 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // nums[j]를 오른쪽으로 한 칸 이동한다
                j--;
            }
            nums[j + 1] = bas;         // 올바른 위치에 base를 대입한다
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        InsertionSort(nums);
        Console.WriteLine("삽입 정렬을 마친 후 nums = " + string.Join(",", nums));
    }
}
