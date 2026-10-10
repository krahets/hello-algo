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
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (Integer choice : choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1 段または 2 段上ることを選べる
        int state = 0; // 第 0 段から上り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] を使って方法数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("%d 段の階段の登り方は全部で %d 通り", n, res));
    }
}
