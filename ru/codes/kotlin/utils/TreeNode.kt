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

    // Правила кодирования при сериализации описаны здесь:
    // https://www.hello-algo.com/ru/chapter_tree/array_representation_of_tree/
    // Двоичное дерево в виде массива:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // Двоичное дерево в виде связанных узлов:
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

    /* Рекурсивно восстановить двоичное дерево из списка */
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

        /* Восстановить двоичное дерево из списка */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* Рекурсивно сериализовать двоичное дерево в список */
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