/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* バックトラッキングによる部分和問題 II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 部分集合の要素の和が target に等しくなったら解を記録する
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // すべての選択肢を調べる
        // 枝刈り 2：start から調べて部分集合の重複を防ぐ
        // 枝刈り 3：start から調べて同じ要素を二度選ばないようにする
        for (int i = start; i < choices.Length; i++) {
            // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
            // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
            if (target - choices[i] < 0) {
                break;
            }
            // 枝刈り 4：左隣の要素と値が等しければ、探索の枝が重複するので飛ばす
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 試行：選択して target と start を更新する
            state.Add(choices[i]);
            // 次の選択に進む
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 部分和問題 II を解く */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // 状態（部分集合）
        Array.Sort(nums); // nums をソートする
        int start = 0; // 走査の開始位置
        List<List<int>> res = []; // 結果のリスト（部分集合のリスト）
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("入力配列 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("要素の和が " + target + " となるすべての部分集合 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
