/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* 現在の状態が解かを判定 */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* 解を記録する */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* 現在の状態でこの選択が有効か判定 */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* 状態を更新する */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* 状態を復元する */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* バックトラッキング：例題 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // 解かを確認
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res)
    }
    // すべての選択肢を走査する
    for (choice in choices) {
        // 枝刈り：選択が有効か確認
        if (isValid(state, choice)) {
            // 試行：選択を行い、状態を更新する
            makeChoice(state, choice)
            // 次の選択に進む
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // 復元：選択を取り消し、以前の状態に戻す
            undoChoice(state, choice)
        }
    }
}

/* 実行用コード */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化する")
    printTree(root)

    // バックトラッキング
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する")
    for (path in res) {
        val vals = mutableListOf<Int>()
        for (node in path!!) {
            if (node != null) {
                vals.add(node._val)
            }
        }
        println(vals)
    }
}