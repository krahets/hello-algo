/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* 堆的长度为 n ，从节点 i 开始，从顶至底堆化 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // 判断节点 i, l, r 中值最大的节点，记为 ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
            if (ma == i)
                break;
            // 交换两节点
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 循环向下堆化
            i = ma;
        }
    }

    /* 堆排序 */
    void HeapSort(int[] nums) {
        // 建堆操作：堆化除叶节点以外的其他所有节点
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // 从堆中提取最大元素，循环 n-1 轮
        for (int i = nums.Length - 1; i > 0; i--) {
            // 交换根节点与最右叶节点（交换首元素与尾元素）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 以根节点为起点，从顶至底进行堆化
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("堆排序完成后 nums = " + string.Join(" ", nums));
    }
}
