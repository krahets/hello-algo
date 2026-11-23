/**
* File: max_product_cutting.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_product_cutting {
    /* Maximum product after splitting: greedy algorithm */
    int MaxProductCutting(int n) {
        // When n <= 3, one part must be 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
            return (int)Math.Pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // When the remainder is 2, no adjustment is needed
            return (int)Math.Pow(3, a) * 2;
        }
        // When the remainder is 0, no adjustment is needed
        return (int)Math.Pow(3, a);
    }

    [Test]
    public void Test() {
        int n = 58;

        // Greedy algorithm
        int res = MaxProductCutting(n);
        Console.WriteLine("Maximum product after splitting: " + res);
    }
}