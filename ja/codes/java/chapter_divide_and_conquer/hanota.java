/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* 円盤を移動 */
    static void move(List<Integer> src, List<Integer> tar) {
        // src の最上部から円盤を取り出す
        Integer pan = src.remove(src.size() - 1);
        // 円盤を tar の最上部に配置
        tar.add(pan);
    }

    /* ハノイの塔問題 f(i) を解く */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // src に円盤が1つだけ残っている場合、それを tar に移動
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：tar の助けを借りて、上位 i-1 個の円盤を src から buf に移動
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：残りの1つの円盤を src から tar に移動
        move(src, tar);
        // 部分問題 f(i-1)：src の助けを借りて、上位 i-1 個の円盤を buf から tar に移動
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔問題を解く */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // B の助けを借りて、上位 n 個の円盤を A から C に移動
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // リストの末尾が柱の最上部
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("初期状態:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("円盤移動後:");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}