/**
 * File: TreeNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 二分木のノードクラス */
/* コンストラクタ */
class TreeNode(
    var _val: Int // ノードの値
) {
    var height: Int = 0 // ノードの高さ
    var left: TreeNode? = null // 左の子ノードへの参照
    var right: TreeNode? = null // 右の子ノードへの参照

    // シリアライズの符号化規則は次を参照：
    // https://www.hello-algo.com/ja/chapter_tree/array_representation_of_tree/
    // 二分木の配列表現：
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // 二分木の連結リスト表現：
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

    /* リストから二分木へデシリアライズ：再帰 */
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

        /* リストから二分木へデシリアライズ */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* 二分木をシリアライズしてリストにする：再帰 */
        private fun treeToListDFS(root: TreeNode?, i: Int, res: MutableList<Int?>) {
            if (root == null) return
            while (i >= res.size) {
                res.add(null)
            }
            res[i] = root._val
            treeToListDFS(root.left, 2 * i + 1, res)
            treeToListDFS(root.right, 2 * i + 2, res)
        }

        /* 二分木をシリアライズしてリストにする */
        fun treeToList(root: TreeNode?): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            treeToListDFS(root, 0, res)
            return res
        }
    }
}