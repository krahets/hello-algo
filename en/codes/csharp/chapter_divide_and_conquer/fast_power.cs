/**
 * File: fast_power.cs
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

namespace hello_algo.chapter_divide_and_conquer;

public class fast_power {
    /* Exponentiation by squaring */
    int FastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = FastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }

    [Test]
    public void Test() {
        Assert.That(FastPow(7, 0), Is.EqualTo(1));
        Assert.That(FastPow(3, 5), Is.EqualTo(243));
        Assert.That(FastPow(2, 6), Is.EqualTo(64));
    }
}
