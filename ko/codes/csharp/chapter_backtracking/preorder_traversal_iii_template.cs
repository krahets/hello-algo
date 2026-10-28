/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* 현재 상태가 해인지 판단 */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 해를 기록한다 */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 현재 상태에서 해당 선택이 유효한지 판단 */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 상태 갱신 */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 상태 복원 */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* 백트래킹 알고리즘: 예제 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 해인지 확인한다
        if (IsSolution(state)) {
            // 해를 기록한다
            RecordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        foreach (TreeNode choice in choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (IsValid(state, choice)) {
                // 시도: 선택하고 상태를 갱신한다
                MakeChoice(state, choice);
                // 다음 선택을 진행한다
                Backtrack(state, [choice.left!, choice.right!], res);
                // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n이진 트리 초기화");
        PrintUtil.PrintTree(root);

        // 백트래킹 알고리즘
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
