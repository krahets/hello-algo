/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* 移动一个圆盘 */
    static void move(List<Integer> src, List<Integer> tar) {
        // 从 src 顶部拿出一个圆盘
        Integer pan = src.remove(src.size() - 1);
        // 将圆盘放入 tar 顶部
        tar.add(pan);
    }

    /* 求解汉诺塔问题 f(i) */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // 若 src 只剩下一个圆盘，则直接将其移到 tar
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
        dfs(i - 1, src, tar, buf);
        // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
        move(src, tar);
        // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
        dfs(i - 1, buf, src, tar);
    }

    /* 求解汉诺塔问题 */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // 将 A 顶部 n 个圆盘借助 B 移到 C
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // 列表尾部是柱子顶部
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("初始状态下：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("圆盘移动完成后：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
