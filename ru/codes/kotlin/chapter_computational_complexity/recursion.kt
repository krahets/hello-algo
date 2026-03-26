/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* Рекурсия */
fun recur(n: Int): Int {
    // Условие завершения
    if (n == 1)
        return 1
    // Рек: рекурсивный вызов
    val res = recur(n - 1)
    // Рекурсия: вернуть результат
    return n + res
}

/* Имитировать рекурсию с помощью итерации */
fun forLoopRecur(n: Int): Int {
    // Использовать явный стек для имитации системного стека вызовов
    val stack = Stack<Int>()
    var res = 0
    // Рек: рекурсивный вызов
    for (i in n downTo 0) {
        // Смоделировать шаг «спуск» с помощью операции помещения в стек
        stack.push(i)
    }
    // Рекурсия: вернуть результат
    while (stack.isNotEmpty()) {
        // Смоделировать шаг «подъем» с помощью операции извлечения из стека
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Хвостовая рекурсия */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Добавить ключевое слово tailrec, чтобы включить оптимизацию хвостовой рекурсии
    // Условие завершения
    if (n == 0)
        return res
    // Вызов хвостовой рекурсии
    return tailRecur(n - 1, res + n)
}

/* Последовательность Фибоначчи: рекурсия */
fun fib(n: Int): Int {
    // Условие завершения: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Вернуть результат f(n)
    return res
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nРезультат суммирования рекурсивной функции res = $res")

    res = forLoopRecur(n)
    println("\nИмитировать рекурсию с помощью итерациирезультат суммирования res = $res")

    res = tailRecur(n, 0)
    println("\nРезультат суммирования хвостовой рекурсией res = $res")

    res = fib(n)
    println("\n$n-й элемент последовательности Фибоначчи равен $res")
}
