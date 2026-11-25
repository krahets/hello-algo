/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 이진 탐색 트리 */
class BinarySearchTree {
    private var root: TreeNode?

    /* 생성자 */
    init() {
        // 빈 트리 초기화
        root = nil
    }

    /* 이진 트리의 루트 노드 구하기 */
    func getRoot() -> TreeNode? {
        root
    }

    /* 노드 탐색 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while cur != nil {
            // 찾는 노드는 cur의 오른쪽 서브트리에 있다
            if cur!.val < num {
                cur = cur?.right
            }
            // 찾는 노드는 cur의 왼쪽 서브트리에 있다
            else if cur!.val > num {
                cur = cur?.left
            }
            // 찾는 노드를 발견했으므로 반복문을 종료한다
            else {
                break
            }
        }
        // 찾은 노드를 반환한다
        return cur
    }

    /* 노드 삽입 */
    func insert(num: Int) {
        // 트리가 비어 있으면 루트 노드를 초기화한다
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while cur != nil {
            // 같은 값의 노드를 찾으면 바로 반환한다
            if cur!.val == num {
                return
            }
            pre = cur
            // 삽입 위치는 cur의 오른쪽 서브트리에 있다
            if cur!.val < num {
                cur = cur?.right
            }
            // 삽입 위치는 cur의 왼쪽 서브트리에 있다
            else {
                cur = cur?.left
            }
        }
        // 노드 삽입
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* 노드 삭제 */
    func remove(num: Int) {
        // 트리가 비어 있으면 바로 반환한다
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while cur != nil {
            // 삭제할 노드를 찾았으므로 반복문을 종료한다
            if cur!.val == num {
                break
            }
            pre = cur
            // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
            if cur!.val < num {
                cur = cur?.right
            }
            // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
            else {
                cur = cur?.left
            }
        }
        // 삭제할 노드가 없으면 바로 반환한다
        if cur == nil {
            return
        }
        // 자식 수 = 0 또는 1
        if cur?.left == nil || cur?.right == nil {
            // 자식 수가 0이면 child는 null, 1이면 child는 그 자식 노드다
            let child = cur?.left ?? cur?.right
            // 노드 cur 삭제
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 삭제할 노드가 루트라면 루트 노드를 다시 지정한다
                root = child
            }
        }
        // 자식 수 = 2
        else {
            // 중위 순회에서 cur 다음에 오는 노드를 구한다
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 노드 tmp를 재귀적으로 삭제한다
            remove(num: tmp!.val)
            // cur의 값을 tmp의 값으로 덮어쓴다
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* 실행 코드 */
    static func main() {
        /* 이진 탐색 트리 초기화 */
        let bst = BinarySearchTree()
        // 삽입 순서가 다르면 이진 트리의 모양도 달라진다. 이 순서로 삽입하면 포화 이진 트리가 만들어진다
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\n초기화한 이진 트리:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 노드 탐색 */
        let node = bst.search(num: 7)
        print("\n찾은 노드 객체: \(node!), 노드 값 = \(node!.val)")

        /* 노드 삽입 */
        bst.insert(num: 16)
        print("\n노드 16 삽입 후 이진 트리:\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 노드 삭제 */
        bst.remove(num: 1)
        print("\n노드 1 삭제 후 이진 트리:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\n노드 2 삭제 후 이진 트리:\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\n노드 4 삭제 후 이진 트리:\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
