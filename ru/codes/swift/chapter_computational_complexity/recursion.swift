/**
 * File: recursion.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Рекурсия */
func recur(n: Int) -> Int {
    // Условие остановки
    if n == 1 {
        return 1
    }
    // Спуск: рекурсивный вызов
    let res = recur(n: n - 1)
    // Возврат: передача результата
    return n + res
}

/* Моделирование рекурсии с помощью итерации */
func forLoopRecur(n: Int) -> Int {
    // Смоделировать стек вызовов с помощью явного стека
    var stack: [Int] = []
    var res = 0
    // Спуск: рекурсивный вызов
    for i in (1 ... n).reversed() {
        // Добавление в стек моделирует спуск
        stack.append(i)
    }
    // Возврат: передача результата
    while !stack.isEmpty {
        // Извлечение из стека моделирует возврат
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}

/* Хвостовая рекурсия */
func tailRecur(n: Int, res: Int) -> Int {
    // Условие остановки
    if n == 0 {
        return res
    }
    // Хвостовой рекурсивный вызов
    return tailRecur(n: n - 1, res: res + n)
}

/* Числа Фибоначчи: рекурсия */
func fib(n: Int) -> Int {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // Вернуть результат f(n)
    return res
}

@main
enum Recursion {
    /* Основная программа */
    static func main() {
        let n = 5
        var res = 0

        res = recursion.recur(n: n)
        print("\nСумма при рекурсии: res = \(res)")

        res = recursion.forLoopRecur(n: n)
        print("\nСумма при итеративном моделировании рекурсии: res = \(res)")

        res = recursion.tailRecur(n: n, res: 0)
        print("\nСумма при хвостовой рекурсии: res = \(res)")

        res = recursion.fib(n: n)
        print("\nЧисло Фибоначчи с номером \(n) равно \(res)")
    }
}
