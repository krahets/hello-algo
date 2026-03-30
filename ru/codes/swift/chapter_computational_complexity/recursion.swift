/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Рекурсия */
func recur(n: Int) -> Int {
    // Условие завершения
    if n == 1 {
        return 1
    }
    // Рекурсия: рекурсивный вызов
    let res = recur(n: n - 1)
    // Возврат: вернуть результат
    return n + res
}

/* Имитация рекурсии итерацией */
func forLoopRecur(n: Int) -> Int {
    // Использовать явный стек для имитации системного стека вызовов
    var stack: [Int] = []
    var res = 0
    // Рекурсия: рекурсивный вызов
    for i in (1 ... n).reversed() {
        // Имитировать «рекурсию» с помощью операции помещения в стек
        stack.append(i)
    }
    // Возврат: вернуть результат
    while !stack.isEmpty {
        // Имитировать «возврат» с помощью операции извлечения из стека
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* Хвостовая рекурсия */
func tailRecur(n: Int, res: Int) -> Int {
    // Условие завершения
    if n == 0 {
        return res
    }
    // Хвостовой рекурсивный вызов
    return tailRecur(n: n - 1, res: res + n)
}

/* Последовательность Фибоначчи: рекурсия */
func fib(n: Int) -> Int {
    // Условие завершения: f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // Вернуть результат f(n)
    return res
}

@main
enum Recursion {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nРезультат суммирования в рекурсивной функции res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nРезультат суммирования при имитации рекурсии res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nРезультат суммирования в хвостовой рекурсии res = \(res)")

        res = recursion.fib(n: n)
        print("\nЧлен последовательности Фибоначчи с номером \(n) = \(res)")
    }
}
