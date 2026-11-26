/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* バックトラック */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // n 段目に着いたら、登り方の数を 1 増やす
        if (state == n)
            res[0]++;
        // すべての選択肢を調べる
        foreach (int choice in choices) {
            // 枝刈り：n 段目を越えないようにする
            if (state + choice > n)
                continue;
            // 選択肢を試し、状態を更新する
            Backtrack(choices, state + choice, n, res);
            // 選択を取り消す
        }
    }

    /* 階段の登り方：バックトラック */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 1 段または 2 段登れる
        int state = 0; // 0 段目から登り始める
        List<int> res = [0]; // res[0] に登り方の数を記録する
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"全 {n} 段の階段の登り方は {res} 通り");
    }
}
