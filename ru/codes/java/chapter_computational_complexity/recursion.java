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
        // Условие остановки
        if (n == 1)
            return 1;
        // Спуск: рекурсивный вызов
        int res = recur(n - 1);
        // Возврат: передача результата
        return n + res;
    }

    /* Моделирование рекурсии с помощью итерации */
    static int forLoopRecur(int n) {
        // Смоделировать стек вызовов с помощью явного стека
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // Спуск: рекурсивный вызов
        for (int i = n; i > 0; i--) {
            // Добавление в стек моделирует спуск
            stack.push(i);
        }
        // Возврат: передача результата
        while (!stack.isEmpty()) {
            // Извлечение из стека моделирует возврат
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* Хвостовая рекурсия */
    static int tailRecur(int n, int res) {
        // Условие остановки
        if (n == 0)
            return res;
        // Хвостовой рекурсивный вызов
        return tailRecur(n - 1, res + n);
    }

    /* Числа Фибоначчи: рекурсия */
    static int fib(int n) {
        // Базовые случаи: f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // Вернуть результат f(n)
        return res;
    }

    /* Основная программа */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = recur(n);
        System.out.println("\nСумма при рекурсии: res = " + res);

        res = forLoopRecur(n);
        System.out.println("\nСумма при итеративном моделировании рекурсии: res = " + res);

        res = tailRecur(n, 0);
        System.out.println("\nСумма при хвостовой рекурсии: res = " + res);

        res = fib(n);
        System.out.println("\nЧисло Фибоначчи с номером " + n + " равно " + res);
    }
}
