/**
 * File: TreeNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* Класс узла двоичного дерева */
/* Конструктор */
class TreeNode(
    var _val: Int // Значение узла
) {
    var height: Int = 0 // Высота узла
    var left: TreeNode? = null // Ссылка на левый дочерний узел
    var right: TreeNode? = null // Ссылка на правый дочерний узел

    // Правила кодирования сериализации см.:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Массивное представление двоичного дерева:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // Связное представление двоичного дерева:
    // /——— 15
    // /——— 7
    // /——— 3
    // |    \——— 6
    // |        \——— 12
    // ——— 1
    // \——— 2
    // |    /——— 9
    // \——— 4
    // \——— 8

    /* Десериализовать список в двоичное дерево: рекурсия */
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

        /* Десериализовать список в двоичное дерево */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* Сериализовать двоичное дерево в список: рекурсия */
        private fun treeToListDFS(root: TreeNode?, i: Int, res: MutableList<Int?>) {
            if (root == null) return
            while (i >= res.size) {
                res.add(null)
            }
            res[i] = root._val
            treeToListDFS(root.left, 2 * i + 1, res)
            treeToListDFS(root.right, 2 * i + 2, res)
        }

        /* Сериализовать двоичное дерево в список */
        fun treeToList(root: TreeNode?): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            treeToListDFS(root, 0, res)
            return res
        }
    }
}