/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* Move a disk */
    void Move(List<int> src, List<int> tar) {
        // Take out a disk from the top of src
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // Place the disk on top of tar
        tar.Add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // If there is only one disk left in src, move it directly to tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
        DFS(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining disk from src to tar
        Move(src, tar);
        // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
        DFS(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // Move the top n disks from A to C using B
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // The tail of the list is the top of the rod
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("In initial state:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("After disk movement is complete:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
