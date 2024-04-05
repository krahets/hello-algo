/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 移動一個圓盤 */
func move(src: inout [Int], tar: inout [Int]) {
    // 從 src 頂部拿出一個圓盤
    let pan = src.popLast()!
    // 將圓盤放入 tar 頂部
    tar.append(pan)
}

/* 求解河內塔問題 f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move(src: &src, tar: &tar)
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* 求解河內塔問題 */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // 串列尾部是柱子頂部
    // 將 src 頂部 n 個圓盤藉助 B 移到 C
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // 串列尾部是柱子頂部
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("初始狀態下：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("圓盤移動完成後：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
