/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* 最大切断積：貪欲法 */
    int MaxProductCutting(int n) {
        // n <= 3 のときは、必ず 1 を切り出す
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 余りが 2 のときは、そのままにする
            return (int)Math.Pow(3, a) * 2;
        }
        // 余りが 0 のときは、そのままにする
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // 貪欲法
        int res = MaxProductCutting(n);
        Console.WriteLine("最大分割積は" + res);
    }
}