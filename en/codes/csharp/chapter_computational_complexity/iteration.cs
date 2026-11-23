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
        // Sum 1, 2, ..., n-1, n in a loop
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while loop */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize the loop control variable
        // Sum 1, 2, ..., n-1, n in a loop
        while (i <= n) {
            res += i;
            i += 1; // Update the loop control variable
        }
        return res;
    }

    /* while loop (two updates) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize the loop control variable
        // Sum 1, 4, 10, ... in a loop
        while (i <= n) {
            res += i;
            // Update the loop control variable
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* Nested for loops */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Loop over i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop over j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* Driver code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nSum from the for loop: res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nSum from the while loop: res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nSum from the while loop (two updates): res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\nTraversal result from the nested for loops: " + resStr);
    }
}
