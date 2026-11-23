/**
 * File: binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 실행 코드 */
fun main() {
    /* 이진 트리 초기화 */
    // 노드 초기화
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // 노드 사이의 참조(포인터)를 설정한다
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    println("\n이진 트리 초기화\n")
    printTree(n1)

    /* 노드 삽입과 삭제 */
    val P = TreeNode(0)
    // n1 -> n2 사이에 노드 P를 삽입한다
    n1.left = P
    P.left = n2
    println("\n노드 P를 삽입한 후\n")
    printTree(n1)
    // 노드 P를 삭제한다
    n1.left = n2
    println("\n노드 P를 삭제한 후\n")
    printTree(n1)
}