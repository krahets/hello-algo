/**
 * File: preorder_traversal_ii_compact.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.preorder_traversal_ii_compact

import utils.TreeNode
import utils.printTree

var path: MutableList<TreeNode>? = null
var res: MutableList<MutableList<TreeNode>>? = null

/* 전위 순회: 예제 2 */
fun preOrder(root: TreeNode?) {
    if (root == null) {
        return
    }
    // 시도
    path!!.add(root)
    if (root._val == 7) {
        // 해를 기록한다
        res!!.add(path!!.toMutableList())
    }
    preOrder(root.left)
    preOrder(root.right)
    // 되돌리기
    path!!.removeAt(path!!.size - 1)
}

/* 실행 코드 */
fun main() {
    val root = TreeNode.listToTree(mutableListOf(1, 7, 3, 4, 5, 6, 7))
    println("\n이진 트리 초기화")
    printTree(root)

    // 전위 순회
    path = mutableListOf()
    res = mutableListOf()
    preOrder(root)

    println("\n루트 노드에서 노드 7까지의 모든 경로 출력")
    for (path in res!!) {
        val _vals = mutableListOf<Int>()
        for (node in path) {
            _vals.add(node._val)
        }
        println(_vals)
    }
}