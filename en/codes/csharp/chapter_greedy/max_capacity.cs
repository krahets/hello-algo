/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* 最大容量：贪心 */
    int MaxCapacity(int[] ht) {
        // 初始化 i, j，使其分列数组两端
        int i = 0, j = ht.Length - 1;
        // 初始最大容量为 0
        int res = 0;
        // 循环贪心选择，直至两板相遇
        while (i < j) {
            // 更新最大容量
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 向内移动短板
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // 贪心算法
        int res = MaxCapacity(ht);
        Console.WriteLine("最大容量为 " + res);
    }
}