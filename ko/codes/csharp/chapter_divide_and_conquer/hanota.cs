/**
* File: hanota.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class hanota {
    /* 원판 하나 이동 */
    void Move(List<int> src, List<int> tar) {
        // src의 맨 위에서 원판 하나를 꺼낸다
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 원판을 tar의 맨 위에 놓는다
        tar.Add(pan);
    }

    /* 하노이의 탑 문제 f(i) 풀기 */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
        DFS(i - 1, src, tar, buf);
        // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
        Move(src, tar);
        // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
        DFS(i - 1, buf, src, tar);
    }

    /* 하노이의 탑 문제 풀기 */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
        DFS(n, A, B, C);
    }

    [Test]
    public void Test() {
        // 리스트의 맨 뒤가 기둥의 맨 위이다
        List<int> A = [5, 4, 3, 2, 1];
        List<int> B = [];
        List<int> C = [];
        Console.WriteLine("초기 상태:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));

        SolveHanota(A, B, C);

        Console.WriteLine("원판 이동을 마친 후:");
        Console.WriteLine("A = " + string.Join(", ", A));
        Console.WriteLine("B = " + string.Join(", ", B));
        Console.WriteLine("C = " + string.Join(", ", C));
    }
}
