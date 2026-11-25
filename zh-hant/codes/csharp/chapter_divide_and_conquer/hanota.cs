/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* 移動一個圓盤 */
    void Move(List<int> src, List<int> tar) {
        // 從 src 頂端取出一個圓盤
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 將圓盤放到 tar 頂端
        tar.Add(pan);
    }

    /* 求解河內塔問題 f(i) */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // 若 src 只剩一個圓盤，直接將它移到 tar
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
        DFS(i - 1, src, tar, buf);
        // 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
        Move(src, tar);
        // 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
        DFS(i - 1, buf, src, tar);
    }

    /* 求解河內塔問題 */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // 藉助 B，將 A 頂端的 n 個圓盤移到 C
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // 串列尾端對應柱子頂端
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("初始狀態：");
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
