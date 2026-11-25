/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* Поиск с мемоизацией */
    int DFS(int i, int[] mem) {
        // Для dp[1] и dp[2] вернуть известные значения
        if (i == 1 || i == 2)
            return i;
        // Если dp[i] уже вычислено, вернуть сохранённое значение
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // Сохранить dp[i]
        mem[i] = count;
        return count;
    }

    /* Подъём по лестнице: поиск с мемоизацией */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"Число способов подняться на лестницу из {n} ступеней: {res}.");
    }
}
