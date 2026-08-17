/**
 * File: fast_power.java
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

package chapter_divide_and_conquer;

public class fast_power {
    /* 快速冪 */
    static int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }

    public static void main(String[] args) {
        assert fastPow(7, 0) == 1;
        assert fastPow(3, 5) == 243;
        assert fastPow(2, 6) == 64;
    }
}
