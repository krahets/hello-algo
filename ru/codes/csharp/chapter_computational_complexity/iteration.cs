/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* Цикл for */
    int ForLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл while */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i += 1; // Обновить условную переменную
        }
        return res;
    }

    /* Цикл while (двойное обновление) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* Двойной цикл for */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
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
        Console.WriteLine("\nРезультат суммирования в цикле for res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nРезультат суммирования в цикле while res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nРезультат суммирования в цикле while (двойное обновление) res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\nРезультат обхода в двойном цикле for " + resStr);
    }
}
