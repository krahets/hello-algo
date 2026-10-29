/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 円盤を 1 枚移動する */
func move(src: inout [Int], tar: inout [Int]) {
    // src の一番上から円盤を 1 枚取り出す
    let pan = src.popLast()!
    // tar の一番上に円盤を置く
    tar.append(pan)
}

/* ハノイの塔の問題 f(i) を解く */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
    move(src: &src, tar: &tar)
    // 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* ハノイの塔の問題を解く */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // リストの末尾が棒の一番上に対応する
    // src の上から n 枚の円盤を、B を使って C に移す
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* 実行用コード */
    static func main() {
        // リストの末尾が棒の一番上に対応する
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
