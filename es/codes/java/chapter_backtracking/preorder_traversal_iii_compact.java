/**
 * File: preorder_traversal_iii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* 前序遍历：例题三 */
    static void preOrder(TreeNode root) {
        // 剪枝
        if (root == null || root.val == 3) {
            return;
        }
        // 尝试
        path.add(root);
        if (root.val == 7) {
            // 记录解
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二叉树");
        PrintUtil.printTree(root);

        // 前序遍历
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\n输出所有根节点到节点 7 的路径，路径中不包含值为 3 的节点");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
