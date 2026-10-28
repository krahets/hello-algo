/**
 * File: preorder_traversal_iii_compact.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

var path: [TreeNode] = []
var res: [[TreeNode]] = []

/* 전위 순회: 예제 3 */
func preOrder(root: TreeNode?) {
    // 가지치기
    guard let root = root, root.val != 3 else {
        return
    }
    // 시도
    path.append(root)
    if root.val == 7 {
        // 해를 기록한다
        res.append(path)
    }
    preOrder(root: root.left)
    preOrder(root: root.right)
    // 되돌리기
    path.removeLast()
}

@main
enum PreorderTraversalIIICompact {
    /* 실행 코드 */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n이진 트리 초기화")
        PrintUtil.printTree(root: root)

        // 전위 순회
        path = []
        res = []
        preOrder(root: root)

        print("\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
