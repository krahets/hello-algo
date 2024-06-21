/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* Move a disc */
    static void move(List<Integer> src, List<Integer> tar) {
        // Take out a disc from the top of src
        Integer pan = src.remove(src.size() - 1);
        // Place the disc on top of tar
        tar.add(pan);
    }

    /* Solve the Tower of Hanoi problem f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // If only one disc remains on src, move it to tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
        dfs(i - 1, src, tar, buf);
        // Subproblem f(1): move the remaining one disc from src to tar
        move(src, tar);
        // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
        dfs(i - 1, buf, src, tar);
    }

    /* Solve the Tower of Hanoi problem */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // Move the top n discs from A with the help of B to C
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // The tail of the list is the top of the pillar
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("Initial state:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("After the discs are moved:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
