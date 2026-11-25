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
        // Сложить числа 1, 2, ..., n-1, n в цикле
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл while */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // Задать начальное значение переменной условия
        // Сложить числа 1, 2, ..., n-1, n в цикле
        while (i <= n) {
            res += i;
            i += 1; // Обновить переменную условия
        }
        return res;
    }

    /* Цикл while с двумя обновлениями */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // Задать начальное значение переменной условия
        // Сложить числа 1, 4, 10, ... в цикле
        while (i <= n) {
            res += i;
            // Обновить переменную условия
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* Вложенные циклы for */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // Перебрать i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Перебрать j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* Основная программа */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nСумма в цикле for: res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nСумма в цикле while: res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nСумма в цикле while с двумя обновлениями: res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\nРезультат обхода вложенными циклами for: " + resStr);
    }
}
