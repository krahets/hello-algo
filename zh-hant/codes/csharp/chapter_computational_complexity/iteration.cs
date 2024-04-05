/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* for 迴圈 */
    int ForLoop(int n) {
        int res = 0;
        // 迴圈求和 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 迴圈 */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 初始化條件變數
        // 迴圈求和 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // 更新條件變數
        }
        return res;
    }

    /* while 迴圈（兩次更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 初始化條件變數
        // 迴圈求和 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // 更新條件變數
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* 雙層 for 迴圈 */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // 迴圈 i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // 迴圈 j = 1, 2, ..., n-1, n
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

        res = ForLoop(n);
        Console.WriteLine("\nfor 迴圈的求和結果 res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile 迴圈的求和結果 res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile 迴圈（兩次更新）求和結果 res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\n雙層 for 迴圈的走訪結果 " + resStr);
    }
}
