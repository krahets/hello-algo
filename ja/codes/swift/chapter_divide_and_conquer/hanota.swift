/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 円盤を 1 枚移動 */
func move(src: inout [Int], tar: inout [Int]) {
    // src の上から円盤を1枚取り出す
    let pan = src.popLast()!
    // 円盤を tar の上に置く
    tar.append(pan)
}

/* ハノイの塔の問題 f(i) を解く */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
    move(src: &src, tar: &tar)
    // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* ハノイの塔を解く */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // リストの末尾が柱の上端に対応する
    // src の上から n 個の円盤を、B を介して C に移動する
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // リスト末尾が柱の頂上
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("初期状態：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("円盤の移動完了後：")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
