/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* Рекурсия */
    int Recur(int n) {
        // Условие остановки
        if (n == 1)
            return 1;
        // Спуск: рекурсивный вызов
        int res = Recur(n - 1);
        // Возврат: передача результата
        return n + res;
    }

    /* Моделирование рекурсии с помощью итерации */
    int ForLoopRecur(int n) {
        // Смоделировать стек вызовов с помощью явного стека
        Stack<int> stack = new();
        int res = 0;
        // Спуск: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Добавление в стек моделирует спуск
            stack.Push(i);
        }
        // Возврат: передача результата
        while (stack.Count > 0) {
            // Извлечение из стека моделирует возврат
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Хвостовая рекурсия */
    int TailRecur(int n, int res) {
        // Условие остановки
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return TailRecur(n - 1, res + n);
    }

    /* Числа Фибоначчи: рекурсия */
    int Fib(int n) {
        // Базовые случаи: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }

    /* Основная программа */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\nСумма при рекурсии: res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\nСумма при итеративном моделировании рекурсии: res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\nСумма при хвостовой рекурсии: res = " + res);

        res = Fib(n);
        Console.WriteLine("\nЧисло Фибоначчи с номером " + n + " равно " + res);
    }
}
