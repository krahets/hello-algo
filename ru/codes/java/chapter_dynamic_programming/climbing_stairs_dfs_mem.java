/**
 * File: climbing_stairs_dfs_mem.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class climbing_stairs_dfs_mem {
    /* Поиск с мемоизацией */
    public static int dfs(int i, int[] mem) {
        // Если значения dp[1] и dp[2] уже известны, вернуть их
        if (i == 1 || i == 2)
            return i;
        // Если запись dp[i] уже существует, сразу вернуть ее
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // Записать dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъем по лестнице: поиск с мемоизацией */
    public static int climbingStairsDFSMem(int n) {
        // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDFSMem(n);
        System.out.println(String.format("Для подъема по лестнице из %d ступеней существует %d способов", n, res));
    }
}
