/**
 * File: binary_tree_bfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree
import java.util.*

/* 레벨 순회 */
fun levelOrder(root: TreeNode?): MutableList<Int> {
    // 큐를 초기화하고 루트 노드를 넣는다
    val queue = LinkedList<TreeNode?>()
    queue.add(root)
    // 순회 결과를 저장할 리스트를 초기화한다
    val list = mutableListOf<Int>()
    while (queue.isNotEmpty()) {
        val node = queue.poll()      // 큐에서 노드를 꺼낸다
        list.add(node?._val!!)       // 노드 값을 저장한다
        if (node.left != null)
            queue.offer(node.left)   // 왼쪽 자식을 큐에 넣는다
        if (node.right != null)
            queue.offer(node.right)  // 오른쪽 자식을 큐에 넣는다
    }
    return list
}

/* 실행 코드 */
fun main() {
    /* 이진 트리 초기화 */
    // 리스트에서 바로 이진 트리를 만드는 함수를 사용한다
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n이진 트리 초기화\n")
    printTree(root)

    /* 레벨 순회 */
    val list = levelOrder(root)
    println("\n레벨 순회로 출력한 노드 순서 = $list")
}