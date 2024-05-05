/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Move a disc */
func move(src: inout [Int], tar: inout [Int]) {
    // Take out a disc from the top of src
    let pan = src.popLast()!
    // Place the disc on top of tar
    tar.append(pan)
}

/* Solve the Tower of Hanoi problem f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // If only one disc remains on src, move it to tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // Subproblem f(1): move the remaining one disc from src to tar
    move(src: &src, tar: &tar)
    // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* Solve the Tower of Hanoi problem */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // The tail of the list is the top of the pillar
    // Move the top n disks from src with the help of B to C
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // The tail of the list is the top of the pillar
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("Initial state:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("After the discs are moved:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
