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

    /* 取得二元樹的根節點 */
    fun getRoot(): TreeNode? {
        return root
    }

    /* 搜尋節點 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 用迴圈搜尋，越過葉節點後跳出迴圈
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
        // 回傳目標節點
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
        // 用迴圈搜尋，越過葉節點後跳出迴圈
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
        // 若樹為空，直接返回
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur != null) {
            // 找到要刪除的節點，跳出迴圈
            if (cur._val == num)
                break
            pre = cur
            // 要刪除的節點在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 要刪除的節點在 cur 的左子樹中
            else
                cur.left
        }
        // 若找不到要刪除的節點，直接返回
        if (cur == null)
            return
        // 子節點數為 0 或 1
        if (cur.left == null || cur.right == null) {
            // 有 0 個子節點時，child = null；只有 1 個時，child 指向該子節點
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
                // 若刪除的是根節點，則重新指定根節點
                root = child
            }
            // 子節點數為 2
        } else {
            // 取得中序走訪中 cur 的下一個節點
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // 以遞迴刪除節點 tmp
            remove(tmp._val)
            // 用 tmp 的值覆寫 cur 的值
            cur._val = tmp._val
        }
    }
}

/* 主程式 */
fun main() {
    /* 初始化二元搜尋樹 */
    val bst = BinarySearchTree()
    // 請留意，插入順序不同，建成的二元樹也可能不同。這組序列會建成一棵完美二元樹
    val nums = intArrayOf(8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15)
    for (num in nums) {
        bst.insert(num)
    }
    println("\n初始化後的二元樹為\n")
    printTree(bst.getRoot())

    /* 搜尋節點 */
    val node = bst.search(7)
    println("找到的節點物件為 $node，節點值 = ${node?._val}")

    /* 插入節點 */
    bst.insert(16)
    println("\n插入節點 16 後的二元樹為\n")
    printTree(bst.getRoot())

    /* 刪除節點 */
    bst.remove(1)
    println("\n刪除節點 1 後的二元樹為\n")
    printTree(bst.getRoot())
    bst.remove(2)
    println("\n刪除節點 2 後的二元樹為\n")
    printTree(bst.getRoot())
    bst.remove(4)
    println("\n刪除節點 4 後的二元樹為\n")
    printTree(bst.getRoot())
}