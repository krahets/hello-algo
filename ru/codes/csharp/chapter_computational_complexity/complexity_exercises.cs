/**
 * File: complexity_exercises.cs
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

namespace hello_algo.chapter_computational_complexity;

public class complexity_exercises {
    /* Iterative summation */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Recursive summation */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }

    /* Linear loop */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Quadratic loop */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Logarithmic loop */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }

    [Test]
    public void Test() {
        Assert.That(SumIter(1), Is.EqualTo(1));
        Assert.That(SumRecur(1), Is.EqualTo(1));
        Assert.That(SumIter(4), Is.EqualTo(10));
        Assert.That(SumRecur(4), Is.EqualTo(10));
        Assert.That(LinearLoop(4), Is.EqualTo(6));
        Assert.That(QuadraticLoop(4), Is.EqualTo(20));
        Assert.That(LogarithmicLoop(4), Is.EqualTo(1));
        Assert.That(LogarithmicLoop(5), Is.EqualTo(1));
    }
}
