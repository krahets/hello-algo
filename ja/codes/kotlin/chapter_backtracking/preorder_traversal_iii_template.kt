/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* 現在の状態が解かどうか判定する */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* 解を記録する */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* 現在の状態でその選択が可能か判定する */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* 状態を更新する */
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
    // 解かどうか調べる
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res)
    }
    // すべての選択肢を調べる
    for (choice in choices) {
        // 枝刈り：その選択が可能か調べる
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice)
            // 次の選択に進む
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice)
        }
    }
}

/* 実行例 */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n二分木を初期化")
    printTree(root)

    // バックトラッキング
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力")
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