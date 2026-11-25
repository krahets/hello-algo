/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* 現在の状態が解かどうか判定する */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 解を記録する */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 現在の状態でその選択が可能か判定する */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新する */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 状態を元に戻す */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* バックトラッキング：例題 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かどうか調べる
        if (IsSolution(state)) {
            // 解を記録する
            RecordSolution(state, res);
        }
        // すべての選択肢を調べる
        foreach (TreeNode choice in choices) {
            // 枝刈り：その選択が可能か調べる
            if (IsValid(state, choice)) {
                // 試行：選択して状態を更新する
                MakeChoice(state, choice);
                // 次の選択に進む
                Backtrack(state, [choice.left!, choice.right!], res);
                // 後戻り：選択を取り消し、元の状態に戻す
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化");
        PrintUtil.PrintTree(root);

        // バックトラッキング
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
