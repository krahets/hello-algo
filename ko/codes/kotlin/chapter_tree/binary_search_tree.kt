/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 이진 탐색 트리 */
class BinarySearchTree {
    // 빈 트리를 초기화한다
    private var root: TreeNode? = null

    /* 이진 트리의 루트 노드 반환 */
    fun getRoot(): TreeNode? {
        return root
    }

    /* 노드 탐색 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 목표 노드는 cur의 오른쪽 서브트리에 있다
            cur = if (cur._val < num)
                cur.right
            // 목표 노드는 cur의 왼쪽 서브트리에 있다
            else if (cur._val > num)
                cur.left
            // 목표 노드를 찾았으므로 반복문을 종료한다
            else
                break
        }
        // 목표 노드를 반환한다
        return cur
    }

    /* 노드 삽입 */
    fun insert(num: Int) {
        // 트리가 비어 있으면 루트 노드를 초기화한다
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 중복 노드를 찾으면 바로 반환한다
            if (cur._val == num)
                return
            pre = cur
            // 삽입 위치는 cur의 오른쪽 서브트리에 있다
            cur = if (cur._val < num)
                cur.right
            // 삽입 위치는 cur의 왼쪽 서브트리에 있다
            else
                cur.left
        }
        // 노드 삽입
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* 노드 삭제 */
    fun remove(num: Int) {
        // 트리가 비어 있으면 바로 반환하여 종료한다
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != null) {
            // 삭제할 노드를 찾았으므로 반복문을 종료한다
            if (cur._val == num)
                break
            pre = cur
            // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
            cur = if (cur._val < num)
                cur.right
            // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
            else
                cur.left
        }
        // 삭제할 노드가 없으면 바로 반환한다
        if (cur == null)
            return
        // 자식 노드 수 = 0 또는 1
        if (cur.left == null || cur.right == null) {
            // 자식 노드 수 = 0 / 1이면 child = null / 해당 자식 노드이다
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // 노드 cur를 삭제한다
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
                root = child
            }
            // 자식 노드 수 = 2
        } else {
            // 중위 순회에서 cur의 다음 노드를 구한다
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // 노드 tmp를 재귀적으로 삭제한다
            remove(tmp._val)
            // tmp로 cur를 덮어쓴다
            cur._val = tmp._val
        }
    }
}

/* 실행 코드 */
fun main() {
    /* 이진 탐색 트리 초기화 */
    val bst = BinarySearchTree()
    // 삽입 순서에 따라 서로 다른 이진 트리가 생성된다. 이 순서는 포화 이진 트리를 생성할 수 있다
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n초기화한 이진 트리\n")
    printTree(bst.getRoot())

    /* 노드 탐색 */
    val node = bst.search(7)
    println("찾은 노드 객체: $node, 노드 값 = ${node?._val}")

    /* 노드 삽입 */
    bst.insert(16)
    println("\n노드 16을 삽입한 후의 이진 트리\n")
    printTree(bst.getRoot())

    /* 노드 삭제 */
    bst.remove(1)
    println("\n노드 1을 삭제한 후의 이진 트리\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\n노드 2를 삭제한 후의 이진 트리\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\n노드 4를 삭제한 후의 이진 트리\n")
    printTree(bst.getRoot())
}