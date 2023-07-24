/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* 移动一个圆盘 */
    public void move(List<int> src, List<int> tar) {
        // 从 src 顶部拿出一个圆盘
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 将圆盘放入 tar 顶部
        tar.Add(pan);
    }

    /* 求解汉诺塔：问题 f(i) */
    public void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔 */
    public void solveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }

    [Test]
    public void Test() {
        // 列表尾部是柱子顶部
        List<int> A = new List<int> { 5, 4, 3, 2, 1 };
        List<int> B = new List<int>();
        List<int> C = new List<int>();
        Console.WriteLine("初始状态下：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        solveHanota(A, B, C);

        Console.WriteLine("圆盘移动完成后：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
