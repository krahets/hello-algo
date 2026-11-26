/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for 문 */
    static int forLoop(int n) {
        int res = 0;
        // 1, 2, ..., n-1, n을 차례로 더한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 문 */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
        // 1, 2, ..., n-1, n을 차례로 더한다
        while (i <= n) {
            res += i;
            i++; // 반복 조건에 쓰는 변수를 갱신한다
        }
        return res;
    }

    /* while 문(한 번에 두 번 갱신) */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
        // 1, 4, 10, ...을 차례로 더한다
        while (i <= n) {
            res += i;
            // 반복 조건에 쓰는 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }

    /* 이중 for 문 */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n에 대해 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n에 대해 반복한다
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* 실행 예제 */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor 문의 합 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile 문의 합 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile 문(두 번 갱신)의 합 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n이중 for 문의 순회 결과: " + resStr);
    }
}
