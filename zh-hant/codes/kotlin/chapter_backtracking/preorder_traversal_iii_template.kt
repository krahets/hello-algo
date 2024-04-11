/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* 判斷當前狀態是否為解 */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* 記錄解 */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* 判斷在當前狀態下，該選擇是否合法 */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* 更新狀態 */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* 恢復狀態 */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* 回溯演算法：例題三 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // 檢查是否為解
    if (isSolution(state)) {
        // 記錄解
        recordSolution(state, res)
    }
    // 走訪所有選擇
    for (choice in choices) {
        // 剪枝：檢查選擇是否合法
        if (isValid(state, choice)) {
            // 嘗試：做出選擇，更新狀態
            makeChoice(state, choice)
            // 進行下一輪選擇
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // 回退：撤銷選擇，恢復到之前的狀態
            undoChoice(state, choice)
        }
    }
}

/* Driver Code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n初始化二元樹")
    printTree(root)

    // 回溯演算法
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點")
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