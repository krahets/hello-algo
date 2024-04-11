/**
 * File: TreeNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 二叉树节点类 */
/* 构造方法 */
class TreeNode(
    var _val: Int // 节点值
) {
    var height: Int = 0 // 节点高度
    var left: TreeNode? = null // 左子节点引用
    var right: TreeNode? = null // 右子节点引用

    // 序列化编码规则请参考：
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // 二叉树的数组表示：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二叉树的链表表示：
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* 将列表反序列化为二叉树：递归 */
    companion object {
        private fun listToTreeDFS(arr: MutableList<Int?>, i: Int): TreeNode? {
            if (i < 0 || i >= arr.size || arr[i] == null) {
                return null
            }
            val root = TreeNode(arr[i]!!)
            root.left = listToTreeDFS(arr, 2 * i + 1)
            root.right = listToTreeDFS(arr, 2 * i + 2)
            return root
        }

        /* 将列表反序列化为二叉树 */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* 将二叉树序列化为列表：递归 */
        private fun treeToListDFS(root: TreeNode?, i: Int, res: MutableList<Int?>) {
            if (root == null) return
            while (i >= res.size) {
                res.add(null)
            }
            res[i] = root._val
            treeToListDFS(root.left, 2 * i + 1, res)
            treeToListDFS(root.right, 2 * i + 2, res)
        }

        /* 将二叉树序列化为列表 */
        fun treeToList(root: TreeNode?): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            treeToListDFS(root, 0, res)
            return res
        }
    }
}