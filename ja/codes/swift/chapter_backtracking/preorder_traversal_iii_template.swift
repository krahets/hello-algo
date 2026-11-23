/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 現在の状態が解かを判定 */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* 解を記録する */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* 現在の状態でこの選択が有効か判定 */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* 状態を更新する */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* 状態を復元する */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* バックトラッキング：例題 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // 解かを確認
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // すべての選択肢を走査する
    for choice in choices {
        // 枝刈り：選択が有効か確認
        if isValid(state: state, choice: choice) {
            // 試行：選択を行い、状態を更新する
            makeChoice(state: &state, choice: choice)
            // 次の選択に進む
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // 復元：選択を取り消し、以前の状態に戻す
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* 実行用コード */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n二分木を初期化する")
        PrintUtil.printTree(root: root)

        // バックトラッキング
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
