/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 判斷當前狀態是否為解 */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* 記錄解 */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* 判斷在當前狀態下，該選擇是否合法 */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* 更新狀態 */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* 恢復狀態 */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* 回溯演算法：例題三 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // 檢查是否為解
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // 走訪所有選擇
    for choice in choices {
        // 剪枝：檢查選擇是否合法
        if isValid(state: state, choice: choice) {
            // 嘗試：做出選擇，更新狀態
            makeChoice(state: &state, choice: choice)
            // 進行下一輪選擇
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // 回退：撤銷選擇，恢復到之前的狀態
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n初始化二元樹")
        PrintUtil.printTree(root: root)

        // 回溯演算法
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\n輸出所有根節點到節點 7 的路徑，路徑中不包含值為 3 的節點")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
