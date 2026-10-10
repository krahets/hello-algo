/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* for loop */
    int ForLoop(int n) {
        int res = 0;
        // Sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while loop */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // Update condition variable
        }
        return res;
    }

    /* while loop (two updates) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* Nested for loop */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
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
        Console.WriteLine("\nfor loop sum result res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile loop sum result res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile loop (two updates) sum result res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\nDouble for loop traversal result " + resStr);
    }
}
