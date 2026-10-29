/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* 分割後の積の最大化：貪欲法 */
    int MaxProductCutting(int n) {
        // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 の場合、何もしない
            return (int)Math.Pow(3, a) * 2;
        }
        // 余りが 0 の場合、何もしない
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // 貪欲アルゴリズム
        int res = MaxProductCutting(n);
        Console.WriteLine("分割後の積の最大値は" + res);
    }
}