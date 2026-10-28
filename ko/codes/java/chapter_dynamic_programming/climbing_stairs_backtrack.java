/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* 백트래킹 */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // n번째 계단에 도달하면 방법의 수에 1을 더한다
        if (state == n)
            res.set(0, res.get(0) + 1);
        // 모든 선택지를 순회한다
        for (Integer choice : choices) {
            // 가지치기: n번째 계단을 넘어갈 수 없다
            if (state + choice > n)
                continue;
            // 시도: 선택하고 상태를 갱신한다
            backtrack(choices, state + choice, n, res);
            // 되돌리기
        }
    }

    /* 계단 오르기: 백트래킹 */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 한 계단 또는 두 계단 오르기를 선택할 수 있다
        int state = 0; // 0번째 계단에서 오르기 시작한다
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0]에 방법의 수를 기록한다
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("%d개의 계단을 오르는 방법은 총 %d가지이다", n, res));
    }
}
