/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

public class TreeNode {
    public var val: Int // 节点值
    public var height: Int // 节点高度
    public var left: TreeNode? // 左子节点引用
    public var right: TreeNode? // 右子节点引用

    public init(x: Int) {
        val = x
        height = 0
    }

    public static func listToTree(list: [Int]) -> TreeNode? {
        let size = list.count
        if size == 0 {
            return nil
        }
        let root = TreeNode(x: list[0])
        var queue: [TreeNode] = [root]
        var i = 0
        while !queue.isEmpty {
            let node = queue.removeFirst()
            i += 1
            if i >= size {
                break
            }
            node.left = TreeNode(x: list[i])
            queue.append(node.left!)
            i += 1
            if i >= size {
                break
            }
            node.right = TreeNode(x: list[i])
            queue.append(node.right!)
        }
        return root
    }
}
