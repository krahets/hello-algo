/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* 最大容量：貪欲法 */
    int MaxCapacity(int[] ht) {
        // i, j を初期化し、それぞれ配列の両端に置く
        int i = 0, j = ht.Length - 1;
        // 初期の最大容量は 0
        int res = 0;
        // 2 枚の板が出会うまで貪欲選択を繰り返す
        while (i < j) {
            // 最大容量を更新する
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 短い方を内側へ動かす
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

        // 貪欲法
        int res = MaxCapacity(ht);
        Console.WriteLine("最大容量は " + res);
    }
}