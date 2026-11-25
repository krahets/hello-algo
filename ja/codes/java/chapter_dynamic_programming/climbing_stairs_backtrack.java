/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* バックトラック */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // n 段目に着いたら、登り方の数を 1 増やす
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を調べる
        for (Integer choice : choices) {
            // 枝刈り：n 段目を越えないようにする
            if (state + choice > n)
                continue;
            // 選択肢を試し、状態を更新する
            backtrack(choices, state + choice, n, res);
            // 選択を取り消す
        }
    }

    /* 階段の登り方：バックトラック */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1 段または 2 段登れる
        int state = 0; // 0 段目から登り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] に登り方の数を記録する
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("全 %d 段の階段の登り方は %d 通り", n, res));
    }
}
