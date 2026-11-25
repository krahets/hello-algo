/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* バックトラッキングによる全順列 II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 状態の長さが要素数に達したら解を記録する
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // すべての選択肢を調べる
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
            if (!selected[i] && !duplicated.Contains(choice)) {
                // 試行：選択して状態を更新する
                duplicated.Add(choice); // 選んだ要素の値を記録する
                selected[i] = true;
                state.Add(choice);
                // 次の選択に進む
                Backtrack(state, choices, selected, res);
                // 後戻り：選択を取り消し、元の状態に戻す
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* 全順列 II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("入力配列 nums = " + string.Join(", ", nums));
        Console.WriteLine("すべての順列 res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
