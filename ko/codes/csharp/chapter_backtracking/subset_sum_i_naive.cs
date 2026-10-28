/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* 백트래킹 알고리즘: 부분 집합 합 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 부분 집합의 합이 target과 같으면 해를 기록한다
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 모든 선택지를 순회한다
        for (int i = 0; i < choices.Length; i++) {
            // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
            if (total + choices[i] > target) {
                continue;
            }
            // 시도: 선택하고 원소의 합 total을 갱신한다
            state.Add(choices[i]);
            // 다음 선택을 진행한다
            Backtrack(state, target, total + choices[i], choices, res);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 상태(부분 집합)
        int total = 0; // 부분 집합의 합
        List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("입력 배열 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("부분 집합의 합: " + target + " ; 해당하는 모든 부분 집합 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("이 방법의 출력 결과에는 중복 집합이 포함된다");
    }
}
