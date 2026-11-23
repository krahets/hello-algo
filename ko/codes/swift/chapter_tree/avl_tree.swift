/**
 * File: avl_tree.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* AVL 트리 */
class AVLTree {
    fileprivate var root: TreeNode? // 루트 노드

    init() {}

    /* 노드 높이 반환 */
    func height(node: TreeNode?) -> Int {
        // 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
        node?.height ?? -1
    }

    /* 노드 높이를 갱신한다 */
    private func updateHeight(node: TreeNode?) {
        // 노드 높이는 가장 높은 서브트리의 높이 + 1이다
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }

    /* 균형 인수 반환 */
    func balanceFactor(node: TreeNode?) -> Int {
        // 빈 노드의 균형 인수는 0이다
        guard let node = node else { return 0 }
        // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
        return height(node: node.left) - height(node: node.right)
    }

    /* 오른쪽 회전 연산 */
    private func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // child를 중심으로 node를 오른쪽으로 회전한다
        child?.right = node
        node?.left = grandChild
        // 노드 높이를 갱신한다
        updateHeight(node: node)
        updateHeight(node: child)
        // 회전한 서브트리의 루트 노드를 반환한다
        return child
    }

    /* 왼쪽 회전 연산 */
    private func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // child를 중심으로 node를 왼쪽으로 회전한다
        child?.left = node
        node?.right = grandChild
        // 노드 높이를 갱신한다
        updateHeight(node: node)
        updateHeight(node: child)
        // 회전한 서브트리의 루트 노드를 반환한다
        return child
    }

    /* 회전 연산을 수행하여 해당 서브트리의 균형 복원 */
    private func rotate(node: TreeNode?) -> TreeNode? {
        // 노드 node의 균형 인수를 구한다
        let balanceFactor = balanceFactor(node: node)
        // 왼쪽으로 치우친 트리
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // 오른쪽 회전
                return rightRotate(node: node)
            } else {
                // 왼쪽으로 회전한 후 오른쪽으로 회전한다
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // 오른쪽으로 치우친 트리
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // 왼쪽 회전
                return leftRotate(node: node)
            } else {
                // 오른쪽으로 회전한 후 왼쪽으로 회전한다
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // 균형 트리이므로 회전할 필요 없이 바로 반환한다
        return node
    }

    /* 노드 삽입 */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* 노드의 재귀적 삽입(보조 메서드) */
    private func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. 삽입 위치를 찾아 노드를 삽입한다 */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // 중복 노드는 삽입하지 않고 바로 반환한다
        }
        updateHeight(node: node) // 노드 높이를 갱신한다
        /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
        node = rotate(node: node)
        // 서브트리의 루트 노드를 반환한다
        return node
    }

    /* 노드 삭제 */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* 노드의 재귀적 삭제(보조 메서드) */
    private func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. 노드를 찾아 삭제한다 */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
                if child == nil {
                    return nil
                }
                // 자식 노드 수 = 1이면 node를 바로 삭제한다
                else {
                    node = child
                }
            } else {
                // 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // 노드 높이를 갱신한다
        /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
        node = rotate(node: node)
        // 서브트리의 루트 노드를 반환한다
        return node
    }

    /* 노드 탐색 */
    func search(val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            // 목표 노드는 cur의 오른쪽 서브트리에 있다
            if cur!.val < val {
                cur = cur?.right
            }
            // 목표 노드는 cur의 왼쪽 서브트리에 있다
            else if cur!.val > val {
                cur = cur?.left
            }
            // 목표 노드를 찾았으므로 반복문을 종료한다
            else {
                break
            }
        }
        // 목표 노드를 반환한다
        return cur
    }
}

@main
enum _AVLTree {
    static func testInsert(tree: AVLTree, val: Int) {
        tree.insert(val: val)
        print("\n노드 삽입(\(val)) 후 AVL 트리")
        PrintUtil.printTree(root: tree.root)
    }

    static func testRemove(tree: AVLTree, val: Int) {
        tree.remove(val: val)
        print("\n노드 삭제(\(val)) 후 AVL 트리")
        PrintUtil.printTree(root: tree.root)
    }

    /* 실행 코드 */
    static func main() {
        /* 빈 AVL 트리 초기화 */
        let avlTree = AVLTree()

        /* 노드 삽입 */
        // 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
        testInsert(tree: avlTree, val: 1)
        testInsert(tree: avlTree, val: 2)
        testInsert(tree: avlTree, val: 3)
        testInsert(tree: avlTree, val: 4)
        testInsert(tree: avlTree, val: 5)
        testInsert(tree: avlTree, val: 8)
        testInsert(tree: avlTree, val: 7)
        testInsert(tree: avlTree, val: 9)
        testInsert(tree: avlTree, val: 10)
        testInsert(tree: avlTree, val: 6)

        /* 중복 노드 삽입 */
        testInsert(tree: avlTree, val: 7)

        /* 노드 삭제 */
        // 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
        testRemove(tree: avlTree, val: 8) // 차수가 0인 노드 삭제
        testRemove(tree: avlTree, val: 5) // 차수가 1인 노드 삭제
        testRemove(tree: avlTree, val: 4) // 차수가 2인 노드 삭제

        /* 노드 조회 */
        let node = avlTree.search(val: 7)
        print("\n찾은 노드 객체: \(node!), 노드 값 = \(node!.val)")
    }
}
