/**
 * File: recursion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.recursion

import java.util.*

/* Рекурсия */
fun recur(n: Int): Int {
    // Условие остановки
    if (n == 1)
        return 1
    // Спуск: рекурсивный вызов
    val res = recur(n - 1)
    // Возврат: передача результата
    return n + res
}

/* Моделирование рекурсии с помощью итерации */
fun forLoopRecur(n: Int): Int {
    // Смоделировать стек вызовов с помощью явного стека
    val stack = Stack<Int>()
    var res = 0
    // Спуск: рекурсивный вызов
    for (i in n downTo 0) {
        // Добавление в стек моделирует спуск
        stack.push(i)
    }
    // Возврат: передача результата
    while (stack.isNotEmpty()) {
        // Извлечение из стека моделирует возврат
        res += stack.pop()
    }
    // res = 1+2+3+...+n
    return res
}

/* Хвостовая рекурсия */
tailrec fun tailRecur(n: Int, res: Int): Int {
    // Добавить ключевое слово tailrec для оптимизации хвостовой рекурсии
    // Условие остановки
    if (n == 0)
        return res
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n)
}

/* Числа Фибоначчи: рекурсия */
fun fib(n: Int): Int {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    val res = fib(n - 1) + fib(n - 2)
    // Вернуть результат f(n)
    return res
}

/* Основная программа */
fun main() {
    val n = 5
    var res: Int

    res = recur(n)
    println("\nСумма при рекурсии: res = $res")

    res = forLoopRecur(n)
    println("\nСумма при итеративном моделировании рекурсии: res = $res")

    res = tailRecur(n, 0)
    println("\nСумма при хвостовой рекурсии: res = $res")

    res = fib(n)
    println("\nЧисло Фибоначчи с номером $n равно $res")
}