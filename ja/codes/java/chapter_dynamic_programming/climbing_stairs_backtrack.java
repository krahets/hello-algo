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
        // n段目に到達したとき、解の数に1を加える
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (Integer choice : choices) {
            // 剪定：n段を超えて登ることを許可しない
            if (state + choice > n)
                continue;
            // 試行：選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // 撤回
        }
    }

    /* 階段登り：バックトラッキング */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1段または2段登ることを選択可能
        int state = 0; // 0段目から登り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] を使用して解の数を記録
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("%d段の階段を登る解は%d通りです", n, res));
    }
}