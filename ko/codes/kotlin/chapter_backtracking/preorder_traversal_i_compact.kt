/**
 * File: preorder_traversal_i_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_i_compact

import utils.TreeNode
import utils.printTree

var res: MutableList<TreeNode>? = null

/* 전위 순회: 예제 1 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    if (root._val == 7) {
        // 해를 기록한다
        res!!.add(root)
    }
    preOrder(root.left)
    preOrder(root.right)
}

/* 실행 코드 */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n이진 트리 초기화")
    printTree(root)

    // 전위 순회
    res = mutableListOf()
    preOrder(root)

    println("\n값이 7인 모든 노드 출력")
    val vals = mutableListOf<Int>()
    for (node in res!!) {
        vals.add(node._val)
    }
    println(vals)
}