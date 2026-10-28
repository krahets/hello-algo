/**
* File: recursion.cs
* Created Time: 2023-08-28
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_computational_complexity;

public class recursion {
    /* 재귀 */
    int Recur(int n) {
        // 종료 조건
        if (n == 1)
            return 1;
        // 내려가기: 재귀 호출
        int res = Recur(n - 1);
        // 돌아오기: 결과 반환
        return n + res;
    }

    /* 반복으로 재귀 구현 */
    int ForLoopRecur(int n) {
        // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
        Stack<int> stack = new();
        int res = 0;
        // 내려가기: 재귀 호출
        for (int i = n; i > 0; i--) {
            // 스택에 삽입하여 내려가는 과정을 모방한다
            stack.Push(i);
        }
        // 돌아오기: 결과 반환
        while (stack.Count > 0) {
            // 스택에서 꺼내어 돌아오는 과정을 모방한다
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }

    /* 꼬리 재귀 */
    int TailRecur(int n, int res) {
        // 종료 조건
        if (n == 0)
            return res;
        // 꼬리 재귀 호출
        return TailRecur(n - 1, res + n);
    }

    /* 피보나치 수열: 재귀 */
    int Fib(int n) {
        // 종료 조건 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 재귀 호출 f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 결과 f(n)을 반환한다
        return res;
    }

    /* 실행 코드 */
    [Test]
    public void Test() {
        int n = 5;
        int res;

        res = Recur(n);
        Console.WriteLine("\n재귀 함수로 구한 합 res = " + res);

        res = ForLoopRecur(n);
        Console.WriteLine("\n반복으로 재귀를 구현하여 구한 합 res = " + res);

        res = TailRecur(n, 0);
        Console.WriteLine("\n꼬리 재귀 함수로 구한 합 res = " + res);

        res = Fib(n);
        Console.WriteLine("\n피보나치 수열의 항 번호: " + n + " ; 해당 항의 값: " + res);
    }
}
