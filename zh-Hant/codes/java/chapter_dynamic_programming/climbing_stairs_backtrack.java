/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* 回溯 */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // 走訪所有選擇
        for (Integer choice : choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 可選擇向上爬 1 階或 2 階
        int state = 0; // 從第 0 階開始爬
        List<Integer> res = new ArrayList<>();
        res.add(0); // 使用 res[0] 記錄方案數量
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("爬 %d 階樓梯共有 %d 種方案", n, res));
    }
}
