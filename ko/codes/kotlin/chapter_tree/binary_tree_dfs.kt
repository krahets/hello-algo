/**
 * File: binary_tree_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

// 순회 순서를 저장할 리스트를 초기화한다
var list = mutableListOf<Int>()

/* 전위 순회 */
fun preOrder(root: TreeNode?) {
    if (root == null) return
    // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    list.add(root._val)
    preOrder(root.left)
    preOrder(root.right)
}

/* 중위 순회 */
fun inOrder(root: TreeNode?) {
    if (root == null) return
    // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    inOrder(root.left)
    list.add(root._val)
    inOrder(root.right)
}

/* 후위 순회 */
fun postOrder(root: TreeNode?) {
    if (root == null) return
    // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    postOrder(root.left)
    postOrder(root.right)
    list.add(root._val)
}

/* 실행 코드 */
fun main() {
    /* 이진 트리 초기화 */
    // 여기서는 리스트로 이진 트리를 바로 생성하는 함수를 사용한다
    val root = TreeNode.listToTree(mutableListOf(1, 2, 3, 4, 5, 6, 7))
    println("\n이진 트리 초기화\n")
    printTree(root)

    /* 전위 순회 */
    list.clear()
    preOrder(root)
    println("\n전위 순회의 노드 출력 순서 = $list")

    /* 중위 순회 */
    list.clear()
    inOrder(root)
    println("\n중위 순회의 노드 출력 순서 = $list")

    /* 후위 순회 */
    list.clear()
    postOrder(root)
    println("\n후위 순회의 노드 출력 순서 = $list")
}