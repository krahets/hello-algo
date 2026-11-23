/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* バックトラッキング */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // n 段目に到達したら、方法の数を 1 増やす
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を走査する
        for (Integer choice : choices) {
            // 枝刈り：n 段目を越えてはならない
            if (state + choice > n)
                continue;
            // 試行：選択を行い、状態を更新する
            backtrack(choices, state + choice, n, res);
            // 復元
        }
    }

    /* 階段の上り方：バックトラッキング */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1 段または 2 段上ることを選択できる
        int state = 0; // 0 段目から上り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] に方法の数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("%d 段の階段を上る方法は全部で %d 通り", n, res));
    }
}
