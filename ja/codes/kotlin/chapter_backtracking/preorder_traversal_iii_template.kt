/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* 現在の状態が解かどうかを判定 */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* 解を記録 */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* 現在の状態で、この選択が有効かどうかを判定 */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* 状態を更新 */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* 状態を元に戻す */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* バックトラッキング：例題 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // 解かどうかを確認
    if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res)
    }
    // すべての選択肢を走査
    for (choice in choices) {
        // 枝刈り：選択が妥当かを確認する
        if (isValid(state, choice)) {
            // 試行: 選択を行い、状態を更新
            makeChoice(state, choice)
            // 次の選択へ進む
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // バックトラック：選択を取り消し、前の状態に戻す
            undoChoice(state, choice)
        }
    }
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化")
    printTree(root)

    // バックトラッキング法
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\n根ノードからノード 7 までのすべての経路を出力し，経路に値が 3 のノードを含まないことを条件とする")
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