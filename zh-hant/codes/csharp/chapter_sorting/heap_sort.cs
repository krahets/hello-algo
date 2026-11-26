/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* 堆積的長度為 n，從節點 i 開始由上而下調整堆積 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // 找出節點 i、l、r 中值最大的節點，記為 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
            if (ma == i)
                break;
            // 交換兩個節點
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 以迴圈繼續向下調整堆積
            i = ma;
        }
    }

    /* 堆積排序 */
    void HeapSort(int[] nums) {
        // 建立堆積：對所有非葉節點執行堆積調整
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // 從堆積中取出最大元素，重複 n-1 輪
        for (int i = nums.Length - 1; i > 0; i--) {
            // 交換根節點與最右側的葉節點（即交換首尾元素）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 從根節點開始，由上而下調整堆積
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("堆積排序完成後 nums = " + string.Join(" ", nums));
    }
}
