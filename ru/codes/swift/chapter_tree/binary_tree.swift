/**
 * File: binary_tree.swift
 * Created Time: 2023-01-18
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

@main
enum BinaryTree {
    /* Driver Code */
    static func main() {
        // [region]{init_binary_tree}
        /* Инициализация двоичного дерева */
        // Инициализация узла
        let n1 = TreeNode(x: 1)
        let n2 = TreeNode(x: 2)
        let n3 = TreeNode(x: 3)
        let n4 = TreeNode(x: 4)
        let n5 = TreeNode(x: 5)
        // Построить связи между узлами (указатели)
        n1.left = n2
        n1.right = n3
        n2.left = n4
        n2.right = n5
        // [endregion]{init_binary_tree}
        print("\nИнициализация двоичного дерева\n")
        PrintUtil.printTree(root: n1)

        // [region]{insert_node}
        /* Вставка и удаление узлов */
        let P = TreeNode(x: 0)
        // Вставить узел P между n1 -> n2
        n1.left = P
        P.left = n2
        // [endregion]{insert_node}
        print("\nПосле вставки узла P\n")
        PrintUtil.printTree(root: n1)
        // [region]{remove_node}
        // Удалить узел P
        n1.left = n2
        // [endregion]{remove_node}
        print("\nПосле удаления узла P\n")
        PrintUtil.printTree(root: n1)
    }
}
