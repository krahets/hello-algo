/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* Рекурсия */
    int Recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = Recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }

    /* Имитация рекурсии итерацией */
    int ForLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        Stack<int> stack = new();
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.Push(i);
        }
        // Возврат: вернуть результат
        while (stack.Count > 0) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Хвостовая рекурсия */
    int TailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return TailRecur(n - 1, res + n);
    }

    /* Последовательность Фибоначчи: рекурсия */
    int Fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }

    /* Driver Code */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\nРезультат суммирования в рекурсивной функции res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\nРезультат суммирования при имитации рекурсии итерацией res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\nРезультат суммирования в хвостовой рекурсии res = " + res);

        res = Fib(n);
        Console.WriteLine("\nЧлен последовательности Фибоначчи с номером " + n + " = " + res);
    }
}
