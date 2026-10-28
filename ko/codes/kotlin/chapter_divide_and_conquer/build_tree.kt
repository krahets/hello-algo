/**
 * File: build_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.build_tree

import utils.TreeNode
import utils.printTree

/* 이진 트리 구성: 분할 정복 */
fun dfs(
    preorder: IntArray,
    inorderMap: Map<Int?, Int?>,
    i: Int,
    l: Int,
    r: Int
): TreeNode? {
    // 서브트리 구간이 비어 있으면 종료한다
    if (r - l < 0) return null
    // 루트 노드를 초기화한다
    val root = TreeNode(preorder[i])
    // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
    val m = inorderMap[preorder[i]]!!
    // 부분 문제: 왼쪽 서브트리 구성
    root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
    // 부분 문제: 오른쪽 서브트리 구성
    root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
    // 루트 노드를 반환한다
    return root
}

/* 이진 트리 구성 */
fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
    val inorderMap = HashMap<Int?, Int?>()
    for (i in inorder.indices) {
        inorderMap[inorder[i]] = i
    }
    val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
    return root
}

/* 실행 코드 */
fun main() {
    val preorder = intArrayOf(3, 9, 2, 1, 7)
    val inorder = intArrayOf(9, 3, 1, 2, 7)
    println("전위 순회 = ${preorder.contentToString()}")
    println("중위 순회 = ${inorder.contentToString()}")

    val root = buildTree(preorder, inorder)
    println("구성한 이진 트리:")
    printTree(root)
}