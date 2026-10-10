/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* 円盤を 1 枚移動 */
    void Move(List<int> src, List<int> tar) {
        // src の上から円盤を1枚取り出す
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 円盤を tar の上に置く
        tar.Add(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        DFS(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        Move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        DFS(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // A の上から n 枚の円盤を B を介して C へ移す
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // リスト末尾が柱の頂上
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("初期状態：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("円盤の移動完了後：");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
