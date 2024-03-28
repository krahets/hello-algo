/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* 移動一個圓盤 */
    void Move(List<int> src, List<int> tar) {
        // 從 src 頂部拿出一個圓盤
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 將圓盤放入 tar 頂部
        tar.Add(pan);
    }

    /* 求解河內塔問題 f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // 若 src 只剩下一個圓盤，則直接將其移到 tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
        DFS(i - 1, src, tar, buf);
        // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
        Move(src, tar);
        // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
        DFS(i - 1, buf, src, tar);
    }

    /* 求解河內塔問題 */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // 將 A 頂部 n 個圓盤藉助 B 移到 C
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // 串列尾部是柱子頂部
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("初始狀態下：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("圓盤移動完成後：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
