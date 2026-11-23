/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* 백트래킹 알고리즘: 모든 순열 II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 상태의 길이가 원소 개수와 같으면 해를 기록한다
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 모든 선택지를 순회한다
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 가지치기: 원소를 중복하여 선택할 수 없으며, 값이 같은 원소도 중복하여 선택할 수 없다
            if (!selected[i] && !duplicated.Contains(choice)) {
                // 시도: 선택하고 상태를 갱신한다
                duplicated.Add(choice); // 선택한 원소의 값을 기록한다
                selected[i] = true;
                state.Add(choice);
                // 다음 선택을 진행한다
                Backtrack(state, choices, selected, res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* 모든 순열 II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("입력 배열 nums = " + string.Join(", ", nums));
        Console.WriteLine("모든 순열 res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
