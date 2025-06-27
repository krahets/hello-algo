/**
 * File: binary_tree_bfs.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_tree

import std.collection.{ArrayList, LinkedList}
import cangjie.utils.TreeNode

/* 层序遍历 */
func levelOrder(root: ?TreeNode): ArrayList<?Int64> {
    // 初始化队列，加入根节点
    let queue = LinkedList<?TreeNode>()
    queue.append(root)
    // 初始化一个列表，用于保存遍历序列
    let list = ArrayList<?Int64>(0)
    while (!queue.isEmpty()) {
        var node = queue.popFirst() // 队列出队
        if (let Some(node) <- node) {
            list.append(node?.val ?? None) // 保存节点值
            if (let Some(left) <- node?.left) {
                queue.append(left) // 左子节点入队
            }
            if (let Some(right) <- node?.right) {
                queue.append(right); // 右子节点入队
            }
        }
    }
    return list
}
