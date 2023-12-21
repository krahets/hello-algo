/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 移动一个圆盘 */
func move(src: inout [Int], tar: inout [Int]) {
    // 从 src 顶部拿出一个圆盘
    let pan = src.popLast()!
    // 将圆盘放入 tar 顶部
    tar.append(pan)
}

/* 求解汉诺塔问题 f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src: &src, tar: &tar)
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* 求解汉诺塔问题 */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // 列表尾部是柱子顶部
    // 将 src 顶部 n 个圆盘借助 B 移到 C
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // 列表尾部是柱子顶部
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("初始状态下：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("圆盘移动完成后：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
