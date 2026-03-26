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
    // Рекурсивный шаг: выполнить рекурсивный вызов
    let res = recur(n: n - 1)
    // Шаг возврата: вернуть результат
    return n + res
}

/* Имитировать рекурсию с помощью итерации */
func forLoopRecur(n: Int) -> Int {
    // Использовать явный стек для имитации системного стека вызовов
    var stack: [Int] = []
    var res = 0
    // Рекурсивный шаг: выполнить рекурсивный вызов
    for i in (1 ... n).reversed() {
        // Смоделировать шаг «спуск» с помощью операции помещения в стек
        stack.append(i)
    }
    // Шаг возврата: вернуть результат
    while !stack.isEmpty {
        // Смоделировать шаг «подъем» с помощью операции извлечения из стека
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
    // Вызов хвостовой рекурсии
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
        print("\nРезультат суммирования рекурсивной функции res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nИмитировать рекурсию с помощью итерациирезультат суммирования res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nРезультат суммирования хвостовой рекурсией res = \(res)")

        res = recursion.fib(n: n)
        print("\n\(n)-й элемент последовательности Фибоначчи равен \(res)")
    }
}
