/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* 判斷當前狀態是否為解 */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 記錄解 */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 判斷在當前狀態下，該選擇是否合法 */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 更新狀態 */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 恢復狀態 */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* 回溯演算法：例題三 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 檢查是否為解
        if (IsSolution(state)) {
            // 記錄解
            RecordSolution(state, res);
        }
        // 走訪所有選擇
        foreach (TreeNode choice in choices) {
            // 剪枝：檢查選擇是否合法
            if (IsValid(state, choice)) {
                // 嘗試：做出選擇，更新狀態
                MakeChoice(state, choice);
                // 進行下一輪選擇
                Backtrack(state, [choice.left!, choice.right!], res);
                // 回退：撤銷選擇，恢復到之前的狀態
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二元樹");
        PrintUtil.PrintTree(root);

        // 回溯演算法
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
