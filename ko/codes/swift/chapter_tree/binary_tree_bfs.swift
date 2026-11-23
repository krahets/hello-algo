/**
 * File: binary_tree_bfs.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 레벨 순서 순회 */
func levelOrder(root: TreeNode) -> [Int] {
    // 큐를 초기화하고 루트 노드를 넣는다
    var queue: [TreeNode] = [root]
    // 순회 순서를 저장할 리스트를 초기화한다
    var list: [Int] = []
    while !queue.isEmpty {
        let node = queue.removeFirst() // 큐에서 꺼낸다
        list.append(node.val) // 노드 값을 저장한다
        if let left = node.left {
            queue.append(left) // 왼쪽 자식 노드를 큐에 삽입한다
        }
        if let right = node.right {
            queue.append(right) // 오른쪽 자식 노드를 큐에 삽입한다
        }
    }
    return list
}

@main
enum BinaryTreeBFS {
    /* 실행 코드 */
    static func main() {
        /* 이진 트리 초기화 */
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        let node = TreeNode.listToTree(arr: [1, 2, 3, 4, 5, 6, 7])!
        print("\n이진 트리 초기화\n")
        PrintUtil.printTree(root: node)

        /* 레벨 순서 순회 */
        let list = levelOrder(root: node)
        print("\n레벨 순서 순회의 노드 출력 순서 = \(list)")
    }
}
