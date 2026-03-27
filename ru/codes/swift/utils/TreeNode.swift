/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Класс узла двоичного дерева */
public class TreeNode {
    public var val: Int // Значение узла
    public var height: Int // Высота узла
    public var left: TreeNode? // Ссылка на левый дочерний узел
    public var right: TreeNode? // Ссылка на правый дочерний узел

    /* Конструктор */
    public init(x: Int) {
        val = x
        height = 0
    }

    // Правила кодирования сериализации см.:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Представление двоичного дерева массивом:
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // Представление двоичного дерева связным списком:
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
    private static func listToTreeDFS(arr: [Int?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(x: arr[i]!)
        root.left = listToTreeDFS(arr: arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr: arr, i: 2 * i + 2)
        return root
    }

    /* Десериализовать список в двоичное дерево */
    public static func listToTree(arr: [Int?]) -> TreeNode? {
        listToTreeDFS(arr: arr, i: 0)
    }

    /* Сериализовать двоичное дерево в список: рекурсия */
    private static func treeToListDFS(root: TreeNode?, i: Int, res: inout [Int?]) {
        if root == nil {
            return
        }
        while i >= res.count {
            res.append(nil)
        }
        res[i] = root?.val
        treeToListDFS(root: root?.left, i: 2 * i + 1, res: &res)
        treeToListDFS(root: root?.right, i: 2 * i + 2, res: &res)
    }

    /* Сериализовать двоичное дерево в список */
    public static func treeToList(root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root: root, i: 0, res: &res)
        return res
    }
}
