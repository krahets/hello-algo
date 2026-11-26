/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Цикл for */
func forLoop(n: Int) -> Int {
    var res = 0
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for i in 1 ... n {
        res += i
    }
    return res
}

/* Цикл while */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // Задать начальное значение переменной условия
    // Сложить числа 1, 2, ..., n-1, n в цикле
    while i <= n {
        res += i
        i += 1 // Обновить переменную условия
    }
    return res
}

/* Цикл while с двумя обновлениями */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // Задать начальное значение переменной условия
    // Сложить числа 1, 4, 10, ... в цикле
    while i <= n {
        res += i
        // Обновить переменную условия
        i += 1
        i *= 2
    }
    return res
}

/* Вложенные циклы for */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // Перебрать i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // Перебрать j = 1, 2, ..., n-1, n
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* Основная программа */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nСумма в цикле for: res = \(res)")

        res = whileLoop(n: n)
        print("\nСумма в цикле while: res = \(res)")

        res = whileLoopII(n: n)
        print("\nСумма в цикле while с двумя обновлениями: res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\nРезультат обхода вложенными циклами for: \(resStr)")
    }
}
