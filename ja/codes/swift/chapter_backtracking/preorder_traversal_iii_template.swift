/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 現在の状態が解かどうかを判定 */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* 解を記録 */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* 現在の状態で、この選択が有効かどうかを判定 */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* 状態を更新 */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* 状態を元に戻す */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* バックトラッキング：例題 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // 解かどうかを確認
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // すべての選択肢を走査
    for choice in choices {
        // 枝刈り：選択が妥当かを確認する
        if isValid(state: state, choice: choice) {
            // 試行: 選択を行い、状態を更新
            makeChoice(state: &state, choice: choice)
            // 次の選択へ進む
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // バックトラック：選択を取り消し、前の状態に戻す
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化")
        PrintUtil.printTree(root: root)

        // バックトラッキング法
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\n根ノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まない")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
