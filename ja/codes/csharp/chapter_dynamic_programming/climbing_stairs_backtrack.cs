/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* バックトラッキング */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // 第 n 段に到達したら、方法数を 1 増やす
        if (state == n)
            res[0]++;
        // すべての選択肢を走査
        foreach (int choice in choices) {
            // 枝刈り: 第 n 段を超えないようにする
            if (state + choice > n)
                continue;
            // 試行: 選択を行い、状態を更新
            Backtrack(choices, state + choice, n, res);
            // バックトラック
        }
    }

    /* 階段登り：バックトラッキング */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 1 段または 2 段上ることを選べる
        int state = 0; // 第 0 段から上り始める
        List<int> res = [0]; // res[0] を使って方法数を記録する
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"{n} 段の階段を上る方法は全部で {res} 通り");
    }
}
