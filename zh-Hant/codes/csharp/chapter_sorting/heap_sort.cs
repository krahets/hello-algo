/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // 判斷節點 i, l, r 中值最大的節點，記為 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
            if (ma == i)
                break;
            // 交換兩節點
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 迴圈向下堆積化
            i = ma;
        }
    }

    /* 堆積排序 */
    void HeapSort(int[] nums) {
        // 建堆積操作：堆積化除葉節點以外的其他所有節點
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // 從堆積中提取最大元素，迴圈 n-1 輪
        for (int i = nums.Length - 1; i > 0; i--) {
            // 交換根節點與最右葉節點（交換首元素與尾元素）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 以根節點為起點，從頂至底進行堆積化
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
