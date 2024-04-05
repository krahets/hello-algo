/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* 移動一個圓盤 */
    static void move(List<Integer> src, List<Integer> tar) {
        // 從 src 頂部拿出一個圓盤
        Integer pan = src.remove(src.size() - 1);
        // 將圓盤放入 tar 頂部
        tar.add(pan);
    }

    /* 求解河內塔問題 f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // 若 src 只剩下一個圓盤，則直接將其移到 tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
        move(src, tar);
        // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解河內塔問題 */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // 將 A 頂部 n 個圓盤藉助 B 移到 C
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // 串列尾部是柱子頂部
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("初始狀態下：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("圓盤移動完成後：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
