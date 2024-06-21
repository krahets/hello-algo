/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* for loop */
    static int forLoop(int n) {
        int res = 0;
        // Loop sum 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* while loop */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Update condition variable
        }
        return res;
    }

    /* while loop (two updates) */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Initialize condition variable
        // Loop sum 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Update condition variable
            i++;
            i *= 2;
        }
        return res;
    }

    /* Double for loop */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Loop i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Loop j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nSum result of the for loop res = " + res);

        res = whileLoop(n);
        System.out.println("\nSum result of the while loop res = " + res);

        res = whileLoopII(n);
        System.out.println("\nSum result of the while loop (with two updates) res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\nResult of the double for loop traversal = " + resStr);
    }
}
