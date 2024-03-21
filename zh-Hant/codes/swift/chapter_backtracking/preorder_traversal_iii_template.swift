/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 判断当前状态是否为解 */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* 记录解 */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* 判断在当前状态下，该选择是否合法 */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* 更新状态 */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* 恢复状态 */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* 回溯算法：例题三 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // 检查是否为解
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // 遍历所有选择
    for choice in choices {
        // 剪枝：检查选择是否合法
        if isValid(state: state, choice: choice) {
            // 尝试：做出选择，更新状态
            makeChoice(state: &state, choice: choice)
            // 进行下一轮选择
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n初始化二叉树")
        PrintUtil.printTree(root: root)

        // 回溯算法
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
