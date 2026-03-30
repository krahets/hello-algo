/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* 現在の状態が解かどうかを判定 */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 解を記録 */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 現在の状態で、この選択が有効かどうかを判定 */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新 */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 状態を元に戻す */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* バックトラッキング：例題 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かどうかを確認
        if (IsSolution(state)) {
            // 解を記録
            RecordSolution(state, res);
        }
        // すべての選択肢を走査
        foreach (TreeNode choice in choices) {
            // 枝刈り：選択が妥当かを確認する
            if (IsValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                MakeChoice(state, choice);
                // 次の選択へ進む
                Backtrack(state, [choice.left!, choice.right!], res);
                // バックトラック：選択を取り消し、前の状態に戻す
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化");
        PrintUtil.PrintTree(root);

        // バックトラッキング法
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\nルートノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まないことを条件とする");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
