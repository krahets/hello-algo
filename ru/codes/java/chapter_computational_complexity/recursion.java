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
        // Рекурсивный шаг: выполнить рекурсивный вызов
        int res = recur(n - 1);
        // Шаг возврата: вернуть результат
        return n + res;
    }

    /* Имитировать рекурсию с помощью итерации */
    static int forLoopRecur(int n) {
        // Использовать явный стек для имитации системного стека вызовов
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Рекурсивный шаг: выполнить рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Смоделировать шаг «спуск» с помощью операции помещения в стек
            stack.push(i);
        }
        // Шаг возврата: вернуть результат
        while (!stack.isEmpty()) {
            // Смоделировать шаг «подъем» с помощью операции извлечения из стека
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
        // Вызов хвостовой рекурсии
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
        System.out.println("\nРезультат суммирования рекурсивной функции res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nИмитировать рекурсию с помощью итерациисуммированиерезультат res =" + res);

        res = tailRecur(n, 0);
        System.out.println("\nРезультат суммирования хвостовой рекурсией res = " + res);

        res = fib(n);
        System.out.println("\n" + n + "-й элемент последовательности Фибоначчи равен " + res);
    }
}
