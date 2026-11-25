/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Перенос одного диска */
func move(src: inout [Int], tar: inout [Int]) {
    // Снимаем верхний диск с src
    let pan = src.popLast()!
    // Кладём диск на вершину tar
    tar.append(pan)
}

/* Решение задачи о ханойских башнях f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // Если с src осталось перенести один диск, кладём его сразу на tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // Подзадача f(1): переносим оставшийся диск с src на tar
    move(src: &src, tar: &tar)
    // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* Решение задачи о ханойских башнях */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // Последний элемент списка соответствует вершине стержня
    // Переносим n верхних дисков с src на C с помощью B
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Основная программа */
    static func main() {
        // Последний элемент списка соответствует вершине стержня
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("Исходное состояние:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("После переноса дисков:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
