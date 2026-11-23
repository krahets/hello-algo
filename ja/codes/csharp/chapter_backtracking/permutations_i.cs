/**
 * File: permutations_i.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_i {
    /* バックトラッキング：すべての順列 I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 状態の長さが要素数と等しくなったら、解を記録する
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // すべての選択肢を走査する
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 枝刈り：同じ要素を繰り返し選んではならない
            if (!selected[i]) {
                // 試行：選択を行い、状態を更新する
                selected[i] = true;
                state.Add(choice);
                // 次の選択に進む
                Backtrack(state, choices, selected, res);
                // 復元：選択を取り消し、以前の状態に戻す
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* すべての順列 I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 3];

        List<List<int>> res = PermutationsI(nums);

        Console.WriteLine("入力配列 nums = " + string.Join(", ", nums));
        Console.WriteLine("すべての順列 res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
