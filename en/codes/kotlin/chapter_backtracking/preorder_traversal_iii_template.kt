/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* Check whether the current state is a solution */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* Record the solution */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* Check whether this choice is valid in the current state */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* Update the state */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* Restore the state */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* Backtracking: example 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // Check for a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res)
    }
    // Try each choice
    for (choice in choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Make a choice and update the state
            makeChoice(state, choice)
            // Make the next choice
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // Backtrack: undo the choice to restore the previous state
            undoChoice(state, choice)
        }
    }
}

/* Driver code */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\nInitialize the binary tree")
    printTree(root)

    // Backtracking
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\nPrint all paths from the root to a node with value 7 that avoid nodes with value 3")
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