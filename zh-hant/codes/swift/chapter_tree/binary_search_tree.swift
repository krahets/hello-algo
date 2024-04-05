/**
 * File: binary_search_tree.swift
 * Created Time: 2023-01-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 二元搜尋樹 */
class BinarySearchTree {
    private var root: TreeNode?

    /* 建構子 */
    init() {
        // 初始化空樹
        root = nil
    }

    /* 獲取二元樹根節點 */
    func getRoot() -> TreeNode? {
        root
    }

    /* 查詢節點 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 目標節點在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目標節點在 cur 的左子樹中
            else if cur!.val > num {
                cur = cur?.left
            }
            // 找到目標節點，跳出迴圈
            else {
                break
            }
        }
        // 返回目標節點
        return cur
    }

    /* 插入節點 */
    func insert(num: Int) {
        // 若樹為空，則初始化根節點
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 找到重複節點，直接返回
            if cur!.val == num {
                return
            }
            pre = cur
            // 插入位置在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子樹中
            else {
                cur = cur?.left
            }
        }
        // 插入節點
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }

    /* 刪除節點 */
    func remove(num: Int) {
        // 若樹為空，直接提前返回
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 找到待刪除節點，跳出迴圈
            if cur!.val == num {
                break
            }
            pre = cur
            // 待刪除節點在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待刪除節點在 cur 的左子樹中
            else {
                cur = cur?.left
            }
        }
        // 若無待刪除節點，則直接返回
        if cur == nil {
            return
        }
        // 子節點數量 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            let child = cur?.left ?? cur?.right
            // 刪除節點 cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 遞迴刪除節點 tmp
            remove(num: tmp!.val)
            // 用 tmp 覆蓋 cur
            cur?.val = tmp!.val
        }
    }
}

@main
enum _BinarySearchTree {
    /* Driver Code */
    static func main() {
        /* 初始化二元搜尋樹 */
        let bst = BinarySearchTree()
        // 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
        let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
        for num in nums {
            bst.insert(num: num)
        }
        print("\n初始化的二元樹為\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 查詢節點 */
        let node = bst.search(num: 7)
        print("\n查詢到的節點物件為 \(node!)，節點值 = \(node!.val)")

        /* 插入節點 */
        bst.insert(num: 16)
        print("\n插入節點 16 後，二元樹為\n")
        PrintUtil.printTree(root: bst.getRoot())

        /* 刪除節點 */
        bst.remove(num: 1)
        print("\n刪除節點 1 後，二元樹為\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 2)
        print("\n刪除節點 2 後，二元樹為\n")
        PrintUtil.printTree(root: bst.getRoot())
        bst.remove(num: 4)
        print("\n刪除節點 4 後，二元樹為\n")
        PrintUtil.printTree(root: bst.getRoot())
    }
}
