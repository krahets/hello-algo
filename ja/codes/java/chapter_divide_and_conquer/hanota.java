/**
 * File: hanota.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import java.util.*;

public class hanota {
    /* 円盤を 1 枚移動 */
    static void move(List<Integer> src, List<Integer> tar) {
        // src の上から円盤を1枚取り出す
        Integer pan = src.remove(src.size() - 1);
        // 円盤を tar の上に置く
        tar.add(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    static void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    static void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }

    public static void main(String[] args) {
        // リスト末尾が柱の頂上
        List<Integer> A = new ArrayList<>(Arrays.asList(5, 4, 3, 2, 1));
        List<Integer> B = new ArrayList<>();
        List<Integer> C = new ArrayList<>();
        System.out.println("初期状態：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);

        solveHanota(A, B, C);

        System.out.println("円盤の移動完了後：");
        System.out.println("A = " + A);
        System.out.println("B = " + B);
        System.out.println("C = " + C);
    }
}
