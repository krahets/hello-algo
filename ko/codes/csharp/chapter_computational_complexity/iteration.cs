/**
* File: iteration.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class iteration {
    /* for 문 */
    int ForLoop(int n) {
        int res = 0;
        // 1, 2, ..., n-1, n을 차례로 더한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 문 */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
        // 1, 2, ..., n-1, n을 차례로 더한다
        while (i <= n) {
            res += i;
            i += 1; // 반복 조건에 쓰는 변수를 갱신한다
        }
        return res;
    }

    /* while 문(한 번에 두 번 갱신) */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
        // 1, 4, 10, ...을 차례로 더한다
        while (i <= n) {
            res += i;
            // 반복 조건에 쓰는 변수를 갱신한다
            i += 1; 
            i *= 2;
        }
        return res;
    }

    /* 이중 for 문 */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // i = 1, 2, ..., n-1, n에 대해 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n에 대해 반복한다
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }

    /* 실행 예제 */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = ForLoop(n);
        Console.WriteLine("\nfor 문의 합 res = " + res);

        res = WhileLoop(n);
        Console.WriteLine("\nwhile 문의 합 res = " + res);

        res = WhileLoopII(n);
        Console.WriteLine("\nwhile 문(두 번 갱신)의 합 res = " + res);

        string resStr = NestedForLoop(n);
        Console.WriteLine("\n이중 for 문의 순회 결과: " + resStr);
    }
}
