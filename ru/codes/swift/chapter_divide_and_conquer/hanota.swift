/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Переместить один диск */
func move(src: inout [Int], tar: inout [Int]) {
    // Взять верхний диск со стержня src
    let pan = src.popLast()!
    // Поместить диск на вершину tar
    tar.append(pan)
}

/* Решить задачу Ханойской башни f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // Если в src остался только один диск, сразу переместить его в tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // Подзадача f(1): переместить оставшийся один диск из src в tar
    move(src: &src, tar: &tar)
    // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* Решить задачу Ханойской башни */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // Конец списка соответствует вершине стержня
    // Переместить n верхних дисков с src на C с помощью B
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // Конец списка соответствует вершине стержня
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("В начальном состоянии:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("После завершения перемещения дисков:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
