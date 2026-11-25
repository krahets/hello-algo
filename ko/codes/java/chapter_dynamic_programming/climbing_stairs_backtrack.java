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
        // n번째 계단에 도달하면 방법 수를 1 늘린다
        if (state == n)
            res.set(0, res.get(0) + 1);
        // 모든 선택지 순회
        for (Integer choice : choices) {
            // 가지치기: n번째 계단을 넘지 않는다
            if (state + choice > n)
                continue;
            // 시도: 선택한 뒤 상태를 갱신한다
            backtrack(choices, state + choice, n, res);
            // 선택 취소
        }
    }

    /* 계단 오르기: 백트래킹 */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 한 번에 한 계단 또는 두 계단을 오른다
        int state = 0; // 0번째 계단에서 출발한다
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0]에 방법 수를 기록한다
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("계단 %d개를 오르는 방법은 %d가지", n, res));
    }
}
