/**
 * File: recursion.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.Stack;

public class recursion {
    /* Рекурсия */
    static int recur(int n) {
        // Условие завершения
        if (n == 1)
            return 1;
        // Рекурсия: рекурсивный вызов
        int res = recur(n - 1);
        // Возврат: вернуть результат
        return n + res;
    }

    /* Имитация рекурсии итерацией */
    static int forLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Рекурсия: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Имитировать «рекурсию» с помощью операции помещения в стек
            stack.push(i);
        }
        // Возврат: вернуть результат
        while (!stack.isEmpty()) {
            // Имитировать «возврат» с помощью операции извлечения из стека
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Хвостовая рекурсия */
    static int tailRecur(int n, int res) {
        // Условие завершения
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }

    /* Последовательность Фибоначчи: рекурсия */
    static int fib(int n) {
        // Условие завершения: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\nРезультат суммирования в рекурсивной функции res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nРезультат суммирования при имитации рекурсии итерацией res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\nРезультат суммирования в хвостовой рекурсии res = " + res);

        res = fib(n);
        System.out.println("\nЧлен последовательности Фибоначчи с номером " + n + " = " + res);
    }
}
