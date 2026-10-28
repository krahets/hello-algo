/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원판 하나 이동 */
func move(src: inout [Int], tar: inout [Int]) {
    // src의 맨 위에서 원판 하나를 꺼낸다
    let pan = src.popLast()!
    // 원판을 tar의 맨 위에 놓는다
    tar.append(pan)
}

/* 하노이의 탑 문제 f(i) 풀기 */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src: &src, tar: &tar)
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* 하노이의 탑 문제 풀기 */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // 리스트의 맨 뒤가 기둥의 맨 위이다
    // B를 이용하여 src의 맨 위 원판 n개를 C로 옮긴다
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* 실행 코드 */
    static func main() {
        // 리스트의 맨 뒤가 기둥의 맨 위이다
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("초기 상태:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("원판 이동을 마친 후:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
