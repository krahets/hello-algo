/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* バックトラッキングによる部分和問題 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 部分集合の要素の和が target に等しくなったら解を記録する
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // すべての選択肢を調べる
        for (int i = 0; i < choices.Length; i++) {
            // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
            if (total + choices[i] > target) {
                continue;
            }
            // 試行：選択して要素の和 total を更新する
            state.Add(choices[i]);
            // 次の選択に進む
            Backtrack(state, target, total + choices[i], choices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 部分和問題 I を解く（重複する部分集合を含む） */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 状態（部分集合）
        int total = 0; // 部分和
        List<List<int>> res = []; // 結果のリスト（部分集合のリスト）
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("入力配列 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("要素の和が " + target + " となるすべての部分集合 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("この方法の出力には重複する集合が含まれる点に注意");
    }
}
