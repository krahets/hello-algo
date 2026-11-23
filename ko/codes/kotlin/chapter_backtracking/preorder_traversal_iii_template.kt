/**
 * File: preorder_traversal_iii_template.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_iii_template

import utils.TreeNode
import utils.printTree

/* 현재 상태가 해인지 판단 */
fun isSolution(state: MutableList<TreeNode?>): Boolean {
    return state.isNotEmpty() && state[state.size - 1]?._val == 7
}

/* 해를 기록한다 */
fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
    res.add(state!!.toMutableList())
}

/* 현재 상태에서 해당 선택이 유효한지 판단 */
fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
    return choice != null && choice._val != 3
}

/* 상태 갱신 */
fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.add(choice)
}

/* 상태 복원 */
fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
    state.removeLast()
}

/* 백트래킹 알고리즘: 예제 3 */
fun backtrack(
    state: MutableList<TreeNode?>,
    choices: MutableList<TreeNode?>,
    res: MutableList<MutableList<TreeNode?>?>
) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res)
    }
    // 모든 선택지를 순회한다
    for (choice in choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 선택하고 상태를 갱신한다
            makeChoice(state, choice)
            // 다음 선택을 진행한다
            backtrack(state, mutableListOf(choice!!.left, choice.right), res)
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            undoChoice(state, choice)
        }
    }
}

/* 실행 코드 */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n이진 트리 초기화")
    printTree(root)

    // 백트래킹 알고리즘
    val res = mutableListOf<MutableList<TreeNode?>?>()
    backtrack(mutableListOf(), mutableListOf(root), res)

    println("\n값이 3인 노드를 포함하지 않는 조건으로, 루트 노드에서 노드 7까지의 모든 경로 출력")
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