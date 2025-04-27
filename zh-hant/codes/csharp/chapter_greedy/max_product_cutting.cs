﻿/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* 最大切分乘積：貪婪 */
    int MaxProductCutting(int n) {
        // 當 n <= 3 時，必須切分出一個 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // 貪婪地切分出 3 ，a 為 3 的個數，b 為餘數
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // 當餘數為 1 時，將一對 1 * 3 轉化為 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // 當餘數為 2 時，不做處理
            return (int)Math.Pow(3, a) * 2;
        }
        // 當餘數為 0 時，不做處理
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // 貪婪演算法
        int res = MaxProductCutting(n);
        Console.WriteLine("最大切分乘積為" + res);
    }
}