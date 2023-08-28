/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* for 循环 */
    public int forLoop(int n) {
        int res = 0;
        // 循环求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 循环 */
    public int whileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // 更新条件变量
        }
        return res;
    }

    /* while 循环（两次更新） */
    public int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化条件变量
        // 循环求和 1, 2, 4, 5...
        while (i <= n) {
            res += i;
            i += 1; // 更新条件变量
            res += i;
            i *= 2; // 更新条件变量
        }
        return res;
    }

    /* 双层 for 循环 */
    public string nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // 循环 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 循环 j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = forLoop(n);
        Console.WriteLine("\nfor 循环的求和结果 res = " + res);

        res = whileLoop(n);
        Console.WriteLine("\nwhile 循环的求和结果 res = " + res);

        res = whileLoopII(n);
        Console.WriteLine("\nwhile 循环（两次更新）求和结果 res = " + res);

        string resStr = nestedForLoop(n);
        Console.WriteLine("\n双层 for 循环的遍历结果 " + resStr);
    }
}
