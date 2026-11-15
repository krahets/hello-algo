/**
 * File: binary_tree.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BinaryTree {
    /* 실행 코드 */
    static func main() {
        /* 이진 트리 초기화 */
        // 노드 초기화
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // 노드 사이의 참조(포인터)를 설정한다
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        print("\n이진 트리 초기화\n")
        PrintUtil.printTree(root: n1)

        /* 노드 삽입과 삭제 */
        let P = TreeNode(x: 0)
        // n1 -> n2 사이에 노드 P를 삽입한다
        n1.left = P
        P.left = n2
        print("\n노드 P를 삽입한 후\n")
        PrintUtil.printTree(root: n1)
        // 노드 P를 삭제한다
        n1.left = n2
        print("\n노드 P를 삭제한 후\n")
        PrintUtil.printTree(root: n1)
    }
}
