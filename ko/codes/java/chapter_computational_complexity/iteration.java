/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for 반복문 */
    static int forLoop(int n) {
        int res = 0;
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while 반복문 */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
        while (i <= n) {
            res += i;
            i++; // 조건 변수를 갱신한다
        }
        return res;
    }

    /* while 반복문(두 번 갱신) */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 조건 변수를 초기화한다
        // 반복문으로 1, 4, 10, ...의 합을 구한다
        while (i <= n) {
            res += i;
            // 조건 변수를 갱신한다
            i++;
            i *= 2;
        }
        return res;
    }

    /* 이중 for 반복문 */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n을 반복한다
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n을 반복한다
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* 실행 코드 */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nfor 반복문으로 구한 합 res = " + res);

        res = whileLoop(n);
        System.out.println("\nwhile 반복문으로 구한 합 res = " + res);

        res = whileLoopII(n);
        System.out.println("\nwhile 반복문(두 번 갱신)으로 구한 합 res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\n이중 for 반복문의 순회 결과 " + resStr);
    }
}
