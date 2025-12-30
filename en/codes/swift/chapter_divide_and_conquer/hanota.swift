/**
 * File: hanota.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Move a disk */
func move(src: inout [Int], tar: inout [Int]) {
    // Take out a disk from the top of src
    let pan = src.popLast()!
    // Place the disk on top of tar
    tar.append(pan)
}

/* Solve the Tower of Hanoi problem f(i) */
func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
    // If there is only one disk left in src, move it directly to tar
    if i == 1 {
        move(src: &src, tar: &tar)
        return
    }
    // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
    dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
    // Subproblem f(1): move the remaining disk from src to tar
    move(src: &src, tar: &tar)
    // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
    dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
}

/* Solve the Tower of Hanoi problem */
func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
    let n = A.count
    // The tail of the list is the top of the rod
    // Move top n disks from src to C using B
    dfs(i: n, src: &A, buf: &B, tar: &C)
}

@main
enum Hanota {
    /* Driver Code */
    static func main() {
        // The tail of the list is the top of the rod
        var A = [5, 4, 3, 2, 1]
        var B: [Int] = []
        var C: [Int] = []
        print("In initial state:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")

        solveHanota(A: &A, B: &B, C: &C)

        print("After disk movement is complete:")
        print("A = \(A)")
        print("B = \(B)")
        print("C = \(C)")
    }
}
