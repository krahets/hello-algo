/**
 * File: binary_tree_dfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

// 순회 순서를 저장할 리스트를 초기화한다
var list: [Int] = []

/* 전위 순회 */
func preOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    list.append(root.val)
    preOrder(root: root.left)
    preOrder(root: root.right)
}

/* 중위 순회 */
func inOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    inOrder(root: root.left)
    list.append(root.val)
    inOrder(root: root.right)
}

/* 후위 순회 */
func postOrder(root: TreeNode?) {
    guard let root = root else {
        return
    }
    // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    postOrder(root: root.left)
    postOrder(root: root.right)
    list.append(root.val)
}

@main
enum BinaryTreeDFS {
    /* 실행 코드 */
    static func main() {
        /* 이진 트리 초기화 */
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        let root = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n이진 트리 초기화\n")
        PrintUtil.printTree(root: root)

        /* 전위 순회 */
        list.removeAll()
        preOrder(root: root)
        print("\n전위 순회의 노드 출력 순서 = \(list)")

        /* 중위 순회 */
        list.removeAll()
        inOrder(root: root)
        print("\n중위 순회의 노드 출력 순서 = \(list)")

        /* 후위 순회 */
        list.removeAll()
        postOrder(root: root)
        print("\n후위 순회의 노드 출력 순서 = \(list)")
    }
}
