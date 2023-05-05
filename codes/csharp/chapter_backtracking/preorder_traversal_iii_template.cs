/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* 判断当前状态是否为解 */
    static bool isSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 记录解 */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 判断在当前状态下，该选择是否合法 */
    static bool isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 更新状态 */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 恢复状态 */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* 回溯算法：例题三 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 检查是否为解
        if (isSolution(state)) {
            // 记录解
            recordSolution(state, res);
            return;
        }
        // 遍历所有选择
        foreach (TreeNode choice in choices) {
            // 剪枝：检查选择是否合法
            if (isValid(state, choice)) {
                // 尝试：做出选择，更新状态
                makeChoice(state, choice);
                // 进行下一轮选择
                backtrack(state, new List<TreeNode> { choice.left, choice.right }, res);
                // 回退：撤销选择，恢复到之前的状态
                undoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode root = TreeNode.ListToTree(new List<int?> { 1, 7, 3, 4, 5, 6, 7 });
        Console.WriteLine("\n初始化二叉树");
        PrintUtil.PrintTree(root);

        // 回溯算法
        List<List<TreeNode>> res = new List<List<TreeNode>>();
        List<TreeNode> choices = new List<TreeNode>() { root };
        backtrack(new List<TreeNode>(), choices, res);

        Console.WriteLine("\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
