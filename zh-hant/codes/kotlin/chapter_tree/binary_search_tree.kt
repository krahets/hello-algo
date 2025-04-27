/**
 * File: binary_search_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 二元搜尋樹 */
class BinarySearchTree {
    // 初始化空樹
    private var root: TreeNode? = null

    /* 獲取二元樹根節點 */
    fun getRoot(): TreeNode? {
        return root
    }

    /* 查詢節點 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 目標節點在 cur 的左子樹中
            else if (cur._val > num)
                cur.left
            // 找到目標節點，跳出迴圈
            else
                break
        }
        // 返回目標節點
        return cur
    }

    /* 插入節點 */
    fun insert(num: Int) {
        // 若樹為空，則初始化根節點
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur._val == num)
                return
            pre = cur
            // 插入位置在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 插入位置在 cur 的左子樹中
            else
                cur.left
        }
        // 插入節點
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }

    /* 刪除節點 */
    fun remove(num: Int) {
        // 若樹為空，直接提前返回
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur._val == num)
                break
            pre = cur
            // 待刪除節點在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 待刪除節點在 cur 的左子樹中
            else
                cur.left
        }
        // 若無待刪除節點，則直接返回
        if (cur == null)
            return
        // 子節點數量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // 刪除節點 cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child
            }
            // 子節點數量 = 2
        } else {
            // 獲取中序走訪中 cur 的下一個節點
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // 遞迴刪除節點 tmp
            remove(tmp._val)
            // 用 tmp 覆蓋 cur
            cur._val = tmp._val
        }
    }
}

/* Driver Code */
fun main() {
    /* 初始化二元搜尋樹 */
    val bst = BinarySearchTree()
    // 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初始化的二元樹為\n")
    printTree(bst.getRoot())

    /* 查詢節點 */
    val node = bst.search(7)
    println("查詢到的節點物件為 $node，節點值 = ${node?._val}")

    /* 插入節點 */
    bst.insert(16)
    println("\n插入節點 16 後，二元樹為\n")
    printTree(bst.getRoot())

    /* 刪除節點 */
    bst.remove(1)
    println("\n刪除節點 1 後，二元樹為\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\n刪除節點 2 後，二元樹為\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\n刪除節點 4 後，二元樹為\n")
    printTree(bst.getRoot())
}