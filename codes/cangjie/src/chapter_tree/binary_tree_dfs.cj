/**
 * File: binary_tree_dfs.cj
 * Created Time: 2025-06-25
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_tree

import std.collection.ArrayList
import cangjie.utils.TreeNode

public class BinaryTreeDfs {
    static let list = ArrayList<?Int64>()
    /* 前序遍历 */
    static func preOrder(root: ?TreeNode): Unit {
        // 访问优先级：根节点 -> 左子树 -> 右子树
        if (let Some(node) <- root) {
            list.add(node.val)
            preOrder(node.left)
            preOrder(node.right)
        }
    }

    /* 中序遍历 */
    static func inOrder(root: ?TreeNode): Unit {
        // 访问优先级：左子树 -> 根节点 -> 右子树
        if (let Some(node) <- root) {
            inOrder(node.left)
            list.add(node.val)
            inOrder(node.right)
        }
    }

    /* 后序遍历 */
    static func postOrder(root: ?TreeNode): Unit {
        // 访问优先级：左子树 -> 右子树 -> 根节点
        if (let Some(node) <- root) {
            inOrder(node.left)
            inOrder(node.right)
            list.add(node.val)
        }
    }
}
